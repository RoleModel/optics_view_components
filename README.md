# Optics ViewComponents

ViewComponents to go with https://github.com/RoleModel/optics

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add optics_view_components

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install optics_view_components

## Usage

Add to `config/application.rb`:

```
require 'view_component'
require 'optics/view_components/engine'
```

Use in a view:
```
<%= render(Optics::Button::Component.new(label: 'Hello')) %>
```

### Add previews to your application's [Lookbook](https://github.com/ViewComponent/lookbook)

Add to `config/application.rb`:

```
    if config.respond_to?(:lookbook)
      config.lookbook.component_paths << Optics::ViewComponents::Engine.root.join('app/components')
    end

    config.view_component.preview_paths << Optics::ViewComponents::Engine.root.join('previews')
```

If you need a custom layout add:
```
    config.view_component.default_preview_layout = 'preview'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/optics_view_components.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
