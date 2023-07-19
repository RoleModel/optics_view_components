# frozen_string_literal: true

module Optics
  class IconPreview < ViewComponent::Preview
    include ComponentHelper

    # @param emphasis select {{ Optics::Icon::Component::EMPHASES }}
    # @param filled toggle
    # @param name
    # @param size select {{ Optics::Icon::Component::SIZES }}
    # @param title
    # @param weight select {{ Optics::Icon::Component::WEIGHTS }}
    def default( # rubocop:disable Metrics/ParameterLists
          emphasis: 'normal',
          filled: false,
          name: 'settings',
          size: 'normal',
          title: nil,
          weight: 'normal'
        )
      component('optics/icon', emphasis:, filled:, name:, size:, title:, weight:)
    end
  end
end
