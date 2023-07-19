# frozen_string_literal: true

module Optics
  module Sidebar
    class Component < ApplicationViewComponent
      VARIANTS = %w[drawer compact rail]

      renders_one :brand, 'Brand'
      renders_many :sidebar_contents, 'SidebarContent'

      accepts :responsive, default: false
      accepts :variant, default: 'drawer'

      def call
        content_tag(
          :nav,
          class: classes
        ) do
          capture do
            concat brand
            sidebar_contents.each do |content|
              concat content
            end
          end
        end
      end

      def classes
        class_names(
          'sidebar',
          variant_class,
          @attributes[:class],
          'sidebar--responsive': responsive
        ).join(' ')
      end

      def variant_class
        "sidebar--#{variant}"
      end

      class Brand < ApplicationViewComponent
        accepts :url
        accepts :img_src
        accepts :name

        def call
          link_to(url, class: 'sidebar__brand') do
            name || image_tag(img_src)
          end
        end
      end

      class SidebarContent < ApplicationViewComponent
        accepts :position, default: 'center'

        def call
          content_tag(:div, class: classes) do
            content
          end
        end

        def classes
          class_names(
            'sidebar__content',
            position_class,
          ).join(' ')
        end

        def position_class
          "sidebar__content--#{position}"
        end
      end

      class LinksComponent < ApplicationViewComponent
        accepts :img_src
        accepts :url

        def call
          link_to(url, class: 'sidebar__brand') do
            image_tag(img_src)
          end
        end
      end
    end
  end
end
