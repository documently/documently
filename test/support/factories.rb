module Documently
  class TestCase < Minitest::Test
    module Factories
      def create_site(name: "site")
        Resources::Site.new(name: name)
      end

      def create_page(
        name: "page",
        metadata: Resource::Metadata.empty,
        site: create_site,
        collection: nil
      )
        page = Resources::Page.new(
          name: name,
          metadata: metadata,
          site: site,
          collection: collection
        )
        site.pages << page

        if !collection.nil?
          collection.pages << page
        end

        page
      end

      def create_collection(name: "collection", site: create_site)
        collection = Resources::Collection.new(name: name, site: site)
        site.collections << collection

        collection
      end

      def create_layout(
        name: "layout",
        metadata: Resource::Metadata.empty,
        site: create_site
      )
        layout = Resources::Layout.new(
          name: name,
          metadata: metadata,
          site: site
        )
        site.layouts << layout

        layout
      end
    end
  end
end
