# frozen_string_literal: true

require_relative 'lib/optics/view_components/version'

Gem::Specification.new do |spec|
  spec.name = 'optics_view_components'
  spec.version = Optics::ViewComponents::VERSION
  spec.authors = ['Reed Law']
  spec.email = ['reed.law@rolemodelsoftware.com']

  spec.summary = 'ViewComponents for the Optics Design System'
  spec.homepage = 'https://github.com/RoleModel/optics_view_components'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.require_paths = ['lib']

  spec.add_runtime_dependency     'view_component', ['> 2.0', '< 4.0']

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'sprockets'
  spec.add_development_dependency 'sprockets-rails'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
