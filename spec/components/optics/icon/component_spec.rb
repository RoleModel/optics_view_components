# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Icon::Component do
  subject { page }

  context 'filled icon with title' do
    let(:component) { Icon::Component.new(name: 'settings', title: 'Settings', filled: true) }

    it 'renders' do
      render_inline(component)

      is_expected.to have_css '.material-symbols-outlined'
      is_expected.to have_css '.icon--filled'
      is_expected.to have_css "span[title='Settings']", text: 'setting'
    end
  end

  context 'outlined icon with size, weight, and emphasis' do
    let(:component) { Icon::Component.new(name: 'plus', size: 'x-large', weight: 'bold', emphasis: 'high') }

    it 'renders' do
      render_inline(component)

      is_expected.to have_css '.icon--x-large'
      is_expected.to have_css '.icon--weight-bold'
      is_expected.to have_css '.icon--high-emphasis'
      is_expected.to have_css 'span', text: 'plus'
    end
  end
end
