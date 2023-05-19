# frozen_string_literal: true

require_relative 'view_components/version'
require_relative 'view_components/engine'

module Optics
  module ViewComponents
    def self.root
      Pathname(File.expand_path(File.join('..', '..'), __dir__))
    end
  end
end
