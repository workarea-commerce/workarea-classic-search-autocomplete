require 'test_helper'

module Workarea
  module Storefront
    class SearchAutocompleteIntegrationTest < Workarea::IntegrationTest
      def test_renders_search_suggestions_in_json
        create_product(name: 'Foo')
        create_category(name: 'Foo Category')
        create_page(name: 'Foo Page')

        Metrics::SearchByDay.save_search('foo', 3)
        travel_to 1.week.from_now
        GenerateInsights.generate_all!
        BulkIndexSearches.perform

        get storefront.searches_path(q: 'foo', format: 'json')
        results = JSON.parse(response.body)['results']
        assert_equal(4, results.length)

        search = results.detect { |r| r['type'] == 'Searches' }
        assert(search.present?)
        assert_equal('foo', search['value'])
        assert_equal(storefront.search_path(q: 'foo'), search['url'])

        product = results.detect { |r| r['type'] == 'Products' }
        assert(product.present?)
        assert_equal('Foo', product['value'])
        assert_match(/product_images/, product['image'])
        assert_equal(storefront.product_path('foo'), product['url'])

        category = results.detect { |r| r['type'] == 'Categories' }
        assert(category.present?)
        assert_equal('Foo Category', category['value'])
        assert_equal(storefront.category_path('foo-category'), category['url'])

        page = results.detect { |r| r['type'] == 'Pages' }
        assert(page.present?)
        assert_equal('Foo Page', page['value'])
        assert_equal(storefront.page_path('foo-page'), page['url'])
      end
    end
  end
end
