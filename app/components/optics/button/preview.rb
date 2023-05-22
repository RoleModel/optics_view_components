# frozen_string_literal: true

module Optics
  module Button
    class Preview < ApplicationViewComponentPreview
      # @param border toggle
      # @param icon toggle
      # @param id text
      # @param label text
      # @param size select {{ ::Button::Component::SIZES }}
      # @param variant select {{ ::Button::Component::STYLES }}
      # @param url text
      def default( # rubocop:disable Metrics/ParameterLists
            border: true,
            icon: false,
            id: nil,
            label: 'Default',
            size: 'normal',
            variant: 'default',
            url: nil
          )
        render(Button::Component.new(
                 border:,
                 icon:,
                 id:,
                 label:,
                 size:,
                 variant:,
                 url:,
               ))
      end
    end
  end
end
