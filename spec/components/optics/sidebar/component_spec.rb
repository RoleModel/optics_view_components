# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Optics::Sidebar::Component do
  subject { page }

  context 'sidebar' do
    context 'default' do
      let(:component) { described_class.new }

      it do
        render_inline(component) { |sidebar| sidebar.with_brand(name: 'Optics', url: 'https://www.example.com') }

        is_expected.to have_text 'Optics'
        is_expected.to have_css 'nav.sidebar'
        is_expected.not_to have_css '.sidebar--responsive'
      end
    end

    context 'passing attributes' do
      let(:component) { described_class.new(data: { test: 1 }) }

      it do
        render_inline(component)

        is_expected.to have_css 'nav[data-test="1"]'
      end
    end

    context 'preview' do
      it do
        render_preview(:default, from: Optics::SidebarPreview)

        is_expected.to have_css 'nav'
      end
    end
  end
end
