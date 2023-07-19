# frozen_string_literal: true

module Optics
  class ButtonPreview < ViewComponent::Preview
    include ComponentHelper

    # @param active toggle
    # @param border toggle
    # @param disabled toggle
    # @param icon toggle
    # @param icon_with_label toggle
    # @param id text
    # @param label text
    # @param pill toggle
    # @param size select {{ Optics::Button::Component::SIZES }}
    # @param variant select {{ Optics::Button::Component::STYLES }}
    # @param url text
    def default( # rubocop:disable Metrics/ParameterLists
      active: false,
      border: true,
      disabled: false,
      icon: false,
      icon_with_label: false,
      id: nil,
      label: 'Default',
      pill: false,
      size: 'medium',
      variant: 'default',
      url: nil
    )
      component 'optics/button', active:, border:, disabled:, icon:, icon_with_label:, id:, label:, pill:, size:,
                                 variant:, url:
    end

    # @param active toggle
    # @param border toggle
    # @param disabled toggle
    # @param icon toggle
    # @param icon_with_label toggle
    # @param id text
    # @param pill toggle
    # @param size select {{ Optics::Button::Component::SIZES }}
    # @param variant select {{ Optics::Button::Component::STYLES }}
    # @param url text
    def with_icon( # rubocop:disable Metrics/ParameterLists
      active: false,
      border: true,
      disabled: false,
      icon: false,
      icon_with_label: false,
      id: nil,
      pill: false,
      size: 'medium',
      variant: 'default',
      url: nil
    )
      render_with_template(locals: { active:, border:, disabled:, icon:, icon_with_label:, id:, pill:, size:, variant:, url: })
    end
  end
end
