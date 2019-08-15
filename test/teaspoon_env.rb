require 'workarea/testing/teaspoon'

Teaspoon.configure do |config|
  config.root = Workarea::ClassicSearchAutocomplete::Engine.root
  Workarea::Teaspoon.apply(config)
end
