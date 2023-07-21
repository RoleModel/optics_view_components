# frozen_string_literal: true

require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'rails/test_unit/railtie'
require 'sprockets/railtie'

require 'view_component'
require 'optics/view_components'
require 'optics/view_components/engine'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Demo
  class Application < Rails::Application
    config.load_defaults 7.0

    config.view_component.default_preview_layout = 'preview'
    config.view_component.preview_paths = [Optics::ViewComponents::Engine.root.join('previews')]
    config.lookbook.project_name = "Optics ViewComponents v#{Optics::ViewComponents::VERSION}"
    config.lookbook.component_paths = [Optics::ViewComponents::Engine.root.join('app', 'components')]
    config.view_component.show_previews = true
  end
end
