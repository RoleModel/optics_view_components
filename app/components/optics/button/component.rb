# frozen_string_literal: true

module Optics
  module Button
    class Component < ApplicationViewComponent
      SIZES = %w[small medium large].freeze
      STYLES = %w[default primary secondary delete].freeze

      accepts :label
      accepts :active, default: false
      accepts :border, default: true
      accepts :disabled, default: false
      accepts :icon, default: false
      accepts :icon_with_label, default: false
      accepts :pill, default: false
      accepts :size, default: 'medium'
      accepts :variant, default: 'default'
      accepts :url

      def call
        build_button do
          content || label
        end
      end

      def build_button(&)
        return link_to(url, class: classes, **@attributes.except(:class), &) if url && !disabled

        tag.button(class: classes, disabled:, **@attributes.except(:class), &)
      end

      def button_class
        return 'btn' if variant == 'default'

        "btn-#{variant}"
      end

      def classes
        class_names(
          @attributes[:class],
          button_class,
          size_class,
          'btn--active': active,
          'btn--disabled': disabled,
          'btn--icon': icon,
          'btn--icon-with-label': icon_with_label,
          'btn--no-border': !border,
          'btn--pill': pill
        ).join(' ')
      end

      def size_class
        return if size == 'medium'

        "btn--#{size}"
      end
    end
  end
end
