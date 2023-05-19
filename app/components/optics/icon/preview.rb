# frozen_string_literal: true

module Icon
  class Preview < ViewComponent::Preview
    # @param emphasis select {{ ::Icon::Component::EMPHASES }}
    # @param filled toggle
    # @param name
    # @param size select {{ ::Icon::Component::SIZES }}
    # @param title
    # @param weight select {{ ::Icon::Component::WEIGHTS }}
    def default( # rubocop:disable Metrics/ParameterLists
      emphasis: 'normal',
      filled: false,
      name: 'settings',
      size: 'normal',
      title: nil,
      weight: 'normal'
    )
      render(
        Icon::Component.new(
          emphasis:,
          filled:,
          name:,
          size:,
          title:,
          weight:
        )
      )
    end
  end
end
