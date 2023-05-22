# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Optics::Button::Component do
  subject { page }

  context 'button tag' do
    context 'default' do
      let(:component) { described_class.new(label: 'New Project') }

      it do
        render_inline(component)

        is_expected.to have_text 'New Project'
        is_expected.to have_css 'button.btn'
        is_expected.not_to have_css '.btn-primary.btn--large'
      end
    end

    context 'passing attributes' do
      let(:component) { described_class.new(label: '1', data: { test: 1 }) }

      it do
        render_inline(component)

        is_expected.to have_css 'button[data-test="1"]'
      end
    end

    context 'custom' do
      let(:component) { described_class.new(label: 'New Project', size: 'large', variant: 'primary') }

      it do
        render_inline(component)

        is_expected.to have_text 'New Project'
        is_expected.to have_css 'button.btn-primary.btn--large'
      end
    end

    context 'preview' do
      it do
        render_preview(:default, params: { label: 'Hello' }, from: Optics::Button::Preview)

        is_expected.to have_css 'button'
      end
    end
  end

  context 'link_to' do
    context 'default' do
      let(:component) { described_class.new(url: '/', label: 'Press Me') }

      it do
        render_inline(component)

        is_expected.to have_text 'Press Me'
        is_expected.to have_css 'a.btn'
        is_expected.not_to have_css '.btn-primary.btn--large'
      end
    end

    context 'passing attributes' do
      let(:component) { described_class.new(url: '/', label: 'Press Me', data: { test: 1 }) }

      it do
        render_inline(component)

        is_expected.to have_css 'a[data-test="1"]'
      end
    end

    context 'custom' do
      let(:component) { described_class.new(url: '/', label: 'Press Me', size: 'large', variant: 'primary') }

      it do
        render_inline(component)

        is_expected.to have_text 'Press Me'
        is_expected.to have_css '.btn-primary.btn--large'
      end
    end

    context 'preview' do
      it do
        render_preview(:default, params: { url: '/', label: 'Press Me' }, from: Optics::Button::Preview)

        is_expected.to have_css 'a'
      end
    end
  end
end
