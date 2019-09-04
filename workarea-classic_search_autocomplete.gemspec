$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "workarea/classic_search_autocomplete/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "workarea-classic_search_autocomplete"
  spec.version     = Workarea::ClassicSearchAutocomplete::VERSION
  spec.authors     = ["Curt Howard"]
  spec.email       = ["choward@workarea.com"]
  spec.homepage    = 'https://github.com/workarea-commerce/workarea-classic_search_autocomplete'
  spec.summary     = "Basic Autocomplete results displayed while searching"
  spec.description = <<~DESCRIPTION
    This plugin displays live results as the user begins to type a search into
    the Storefront search field in a small UI displayed below the field. It
    leverages a customized version of the jQuery UI Autocomplete functionality.
    For a better overall UX and UI for your customers, consider the
    workarea-search_autocomplete plugin instead.
  DESCRIPTION

  spec.files = `git ls-files`.split("\n")

  spec.add_dependency 'workarea', '~> 3.x', '>= 3.5.x'
end
