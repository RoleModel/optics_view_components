# frozen_string_literal: true

class Optics::ApplicationViewComponent < ViewComponent::Base
  class_attribute :optional_attributes, default: {}
  class_attribute :required_attributes, default: {}

  class << self
    # To allow DB queries, put this in the class definition:
    # self.allow_db_queries = true
    attr_accessor :allow_db_queries
    alias allow_db_queries? allow_db_queries

    def requires(parameter, default: nil)
      required_attributes[parameter] = default

      attr_reader parameter
    end

    def accepts(parameter, default: nil)
      optional_attributes[parameter] = default

      attr_reader parameter
    end

    def inherited(subclass)
      subclass.optional_attributes = optional_attributes.dup
      subclass.required_attributes = required_attributes.dup
      super
    end
  end

  def initialize(**attributes)
    initialize_instance_variables(required_attributes, attributes) do |key, _default|
      raise ArgumentError, "Missing keyword: :#{key}"
    end

    initialize_instance_variables(optional_attributes, attributes) do |key, default|
      instance_variable_set("@#{key}", default)
    end

    @attributes = attributes.except(*optional_attributes.keys, *required_attributes.keys)
  end

  def class_for(name)
    "c--#{identifier}--#{name}"
  end

  def container_class
    "c--#{identifier}"
  end

  def class_names_for(*args)
    class_names(*args).map { |name| class_for(name) }.join(' ')
  end

  # Inspired by https://github.com/primer/view_components/blob/v0.1.9/app/lib/primer/class_name_helper.rb#L9
  def class_names(*args) # rubocop:disable Metrics/MethodLength
    [].tap do |classes|
      args.each do |class_name|
        case class_name
        when String
          classes << class_name
        when Hash
          class_name.each do |key, val|
            classes << key if val
          end
        end
      end

      classes.compact!
      classes.uniq!
    end
  end

  # Used by Stimulus. E.g. data-controller=identifier => data-controller='dynamic-form--field'
  def identifier
    @identifier ||= self.class.name.sub('::Component', '').underscore.gsub('_', '-').gsub('/', '--')
  end

  # Helper for Stimulus data attributes
  def data_for(method:, target:)
    data_method(method).merge(data_target(target))
  end

  # Helper for Stimulus controller method
  def data_method(method, event: 'click')
    { action: "#{event}->#{identifier}##{method}" }
  end

  # Helper for Stimulus controller target
  def data_target(target)
    { "#{identifier}": { target: } }
  end

  # Helper for Stimulus controller value
  def data_values(values)
    values.transform_keys do |key|
      "#{identifier}-#{key}-value"
    end
  end

  private

  def initialize_instance_variables(configured_attributes, attributes)
    configured_attributes.each do |key, default|
      if attributes.key?(key)
        instance_variable_set("@#{key}", attributes[key])
      else
        yield(key, default)
      end
    end
  end
end
