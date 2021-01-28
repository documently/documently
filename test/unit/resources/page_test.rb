require "test_helper"

module Documently
  module Resources
    class PageTest < TestCase
      test "by default the title is the titlecased name" do
        page = build_page(name: Resource::Name.new("about"))

        assert_equal "About", page.title.value
      end

      test "the title can be overridden by metadata" do
        page = build_page(
          name: Resource::Name.new("about"),
          metadata: Resource::Metadata.new({title: "About Us"})
        )

        assert_equal "About Us", page.title.value
      end

      test "when the page is the site index, the title is the title of the site" do
        site = build_site(name: Resource::Name.new("blog"))
        page = build_page(name: Resource::Name.new("index"), site: site)

        assert_equal "Blog", page.title.value
      end

      test "by default the permalink is the slug joined to the parent" do
        page = build_page(name: Resource::Name.new("contact_us"))

        assert_equal "/contact-us", page.permalink.value
      end

      test "when the page is the index of a collection the permalink is the permalink of the indexed collection" do
        site = build_site
        build_collection(
          name: Resource::Name.new("posts"),
          site: site
        )
        page = build_page(
          name: Resource::Name.new("posts"),
          site: site,
        )

        assert_equal "/posts/", page.permalink.value
      end
    end
  end
end
