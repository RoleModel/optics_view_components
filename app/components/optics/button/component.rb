# frozen_string_literal: true

module Optics
  module Button
    class Component < ApplicationViewComponent
      SIZES = %w[small medium large].freeze
      STYLES = %w[default primary secondary delete].freeze

      renders_one :leading_icon, lambda { |name:, size: 'normal'|
        Icon::Component.new(name:, size:)
      }

      accepts :label
      accepts :border, default: true
      accepts :icon, default: false
      accepts :size, default: 'medium'
      accepts :variant, default: 'default'
      accepts :url

      def build_button(&)
        return link_to(url, class: classes, **@attributes, &) if url

        tag.button(class: classes, **@attributes, &)
      end

      def button_class
        return 'btn' if variant == 'default'

        "btn-#{variant}"
      end

      def classes
        class_names(
          button_class,
          size_class,
          'btn--icon': icon,
          'btn--no-border': !border
        ).join(' ')
      end

      def size_class
        return if size == 'medium'

        "btn--#{size}"
      end
    end
  end
end
