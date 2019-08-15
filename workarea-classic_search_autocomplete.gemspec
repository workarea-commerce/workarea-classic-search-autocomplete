$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "workarea/classic_search_autocomplete/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "workarea-classic_search_autocomplete"
  spec.version     = Workarea::ClassicSearchAutocomplete::VERSION
  spec.authors     = ["Curt Howard"]
  spec.email       = ["choward@workarea.com"]
  spec.homepage    = "TODO"
  spec.summary     = "TODO: Summary of ClassicSearchAutocomplete."
  spec.description = "TODO: Description of ClassicSearchAutocomplete."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = 'https://gems.weblinc.com'
  end

  spec.files = `git ls-files`.split("\n")  end
