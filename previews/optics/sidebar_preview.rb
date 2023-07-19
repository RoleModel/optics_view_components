# frozen_string_literal: true

module Optics
  class SidebarPreview < ViewComponent::Preview
    include ComponentHelper

    # @param responsive toggle
    # @param variant select {{ Optics::Sidebar::Component::VARIANTS }}
    def default(
      responsive: true,
      variant: 'drawer'
    )
      component('optics/sidebar', responsive:, variant:) do |sidebar|
        sidebar.with_brand(name: 'Optics', url: 'https://www.example.com')
      end
    end
  end
end
