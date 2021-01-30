require "test_helper"

module Documently
  module Resources
    class PageTest < TestCase
      test "by default the title is the titlecased name" do
        page = build_page(name: "about")

        assert_equal "About", page.title
      end

      test "a custom title can be provided by metadata" do
        page = build_page(
          name: "about",
          metadata: Resource::Metadata.new({title: "About Us"})
        )

        assert_equal "About Us", page.title
      end

      test "when the page is the site index, the title is the title of the site" do
        site = build_site(name: "blog")
        page = build_page(name: "index", site: site)

        assert_equal "Blog", page.title
      end

      test "by default the permalink is the slug joined to the parent" do
        page = build_page(name: "contact_us")

        assert_equal "/contact-us", page.permalink.value
      end

      test "when the page is the index of a collection the permalink is the permalink of the indexed collection" do
        site = build_site
        build_collection(name: "posts", site: site)
        page = build_page(name: "posts", site: site)

        assert_equal "/posts/", page.permalink.value
      end

      test "by default uses the layout of the site" do
        site = build_site
        main_layout = build_layout(name: "main", site: site)
        page = build_page(site: site)

        assert_equal main_layout, page.layout
      end

      test "when in a collection uses the layout of the collection" do
        site = build_site
        collection = build_collection(name: "posts", site: site)
        post_layout = build_layout(name: "post", site: site)
        page = build_page(site: site, collection: collection)

        assert_equal post_layout, page.layout
      end

      test "a custom layout can be provided by metadata" do
        site = build_site
        custom_layout = build_layout(name: "custom", site: site)
        page = build_page(
          metadata: Resource::Metadata.new({layout: "custom"}),
          site: site
        )

        assert_equal custom_layout, page.layout
      end
    end
  end
end
