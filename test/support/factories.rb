module Documently
  class TestCase < Minitest::Test
    module Factories
      def build_site(name: Resource::Name.new("site"))
        Resources::Site.new(name: name)
      end

      def build_page(
        name: Resource::Name.new("page"),
        metadata: Resource::Metadata.empty,
        site: build_site,
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

      def build_collection(
        name: Resource::Name.new("collection"),
        site: build_site
      )
        collection = Resources::Collection.new(name: name, site: site)
        site.collections << collection

        collection
      end
    end
  end
end
