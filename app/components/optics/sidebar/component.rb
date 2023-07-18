# frozen_string_literal: true

module Optics
  module Sidebar
    class Component < ApplicationViewComponent
      renders_one :brand, 'Brand'
      renders_many :buttons, Optics::Button::Component

      accepts :variant, default: 'drawer'

      def call
        content_tag(
          :nav,
          class: classes
        ) do
          capture do
            concat brand
            concat(
              content_tag(
                :div,
                class: 'sidebar__content sidebar__content--center'
              ) do
              buttons.each do |button|
                concat button
              end
            end
            )
          end
        end
      end

      def classes
        class_names(
          'sidebar',
          variant_class,
          @attributes[:class]
        ).join(' ')
      end

      def variant_class
        "sidebar--#{variant}"
      end

      class Brand < ApplicationViewComponent
        accepts :url
        accepts :image_source

        def call
          link_to(url, class: 'sidebar__brand') do
            image_tag(image_source)
          end
        end
      end

      class LinksComponent < ApplicationViewComponent
        VARIANTS = %w[drawer compact rail]

        accepts :image_source
        accepts :url

        def call
          link_to(url, class: 'sidebar__brand') do
            image_tag(image_source)
          end
        end
      end
    end
  end
end
