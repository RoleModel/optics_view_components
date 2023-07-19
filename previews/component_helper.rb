# frozen_string_literal: true

module ComponentHelper
  def component(name, *args, **kwargs, &)
    render(name.camelize.constantize::Component.new(*args, **kwargs), &)
  end
end
