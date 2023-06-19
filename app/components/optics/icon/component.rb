# frozen_string_literal: true

module Optics
  module Icon
    class Component < ApplicationViewComponent
      SIZES = %w[normal large x-large].freeze
      WEIGHTS = %w[light normal semi-bold bold].freeze
      EMPHASES = %w[low normal high].freeze

      requires :name
      accepts :data
      accepts :emphasis, default: 'normal'
      accepts :filled, default: false
      accepts :size, default: 'normal'
      accepts :title
      accepts :weight, default: 'normal'

      def call
        content_tag(
          :span,
          class: classes,
          'aria-label': title,
          title:,
          data:,
          **@attributes.except(:class)
        ) do
          name
        end
      end

      def classes
        class_names(
          'material-symbols-outlined',
          @attributes[:class],
          size_class,
          weight_class,
          emphasis_class,
          'icon--filled': filled
        ).join(' ')
      end

      def size_class
        return if size == 'normal'

        "icon--#{size}"
      end

      def weight_class
        return if weight == 'normal'

        "icon--weight-#{weight}"
      end

      def emphasis_class
        return if emphasis == 'normal'

        "icon--#{emphasis}-emphasis"
      end
    end
  end
end
