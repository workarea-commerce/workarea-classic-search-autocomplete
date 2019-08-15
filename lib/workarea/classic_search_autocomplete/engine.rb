require 'workarea/classic_search_autocomplete'

module Workarea
  module ClassicSearchAutocomplete
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::ClassicSearchAutocomplete
    end
  end
end
