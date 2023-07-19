# frozen_string_literal: true

module Optics
  class ButtonPreview < ViewComponent::Preview
    include ComponentHelper

    # @param active toggle
    # @param border toggle
    # @param disabled toggle
    # @param icon toggle
    # @param id text
    # @param label text
    # @param size select {{ Optics::Button::Component::SIZES }}
    # @param variant select {{ Optics::Button::Component::STYLES }}
    # @param url text
    def default( # rubocop:disable Metrics/ParameterLists
          active: false,
          border: true,
          disabled: false,
          icon: false,
          id: nil,
          label: 'Default',
          size: 'medium',
          variant: 'default',
          url: nil
        )
      component 'optics/button', active:, border:, disabled:, icon:, id:, label:, size:, variant:, url:
    end
  end
end
