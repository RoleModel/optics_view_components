# frozen_string_literal: true

require 'rails/engine'

module Optics
  module ViewComponents
    class Engine < ::Rails::Engine
      isolate_namespace Optics::ViewComponents

      config.autoload_paths = %W[
        #{root}/lib
      ]

      config.eager_load_paths = %W[
        #{root}/app/components
      ]
    end
  end
end
