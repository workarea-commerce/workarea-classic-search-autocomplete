module Workarea
  module Search
    class SearchSuggestions
      include Query
      include ProductDisplayRules

      document Search::Storefront

      def results
        response['hits']['hits']
      end

      def sanitized_string
        @sanitized_query ||= QueryString.new(params[:q]).sanitized
      end

      def query
        {
          bool: {
            must: [
              {
                match_phrase_prefix: {
                  'content.name': {
                    query: sanitized_string,
                    max_expansions: 10
                  }
                }
              },
              active_for_segments_clause,
              preview_current_release_clause
            ]
          }
        }
      end

      def sort
        { type: :desc }
      end

      def size
        Workarea.config.search_suggestions
      end
    end
  end
end
