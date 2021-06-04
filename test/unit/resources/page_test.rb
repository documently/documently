require "test_helper"

module Documently
  module Resources
    class PageTest < TestCase
      test "#build creates a document by rendering the template" do
        page = create_page(
          template: Template.new(
            source: "content",
            engine: Template::Engines::Markdown.new
          )
        )

        document = page.build

        assert_equal "<p>content</p>\n", document.content
      end

      test "#build passes the site and the page view models to the template as assigns" do
        site = create_site(name: "blog")
        page = create_page(
          name: "about",
          template: Template.new(
            source: "<%= site.name %> <%= page.name %>",
            engine: Template::Engines::ERB.new
          ),
          site: site
        )

        document = page.build

        assert_equal "blog about", document.content
      end

      test "by default the title is the titlecased name" do
        page = create_page(name: "about")

        assert_equal "About", page.title
      end

      test "a custom title can be provided by metadata" do
        page = create_page(
          name: "about",
          metadata: Resource::Metadata.new({"title" => "About Us"})
        )

        assert_equal "About Us", page.title
      end

      test "when the page is the site index, the title is the title of the site" do
        site = create_site(name: "blog")
        page = create_page(name: "index", site: site)

        assert_equal "Blog", page.title
      end

      test "by default the permalink is the slug joined to the parent" do
        page = create_page(name: "contact_us")

        assert_equal "/contact-us", page.permalink.to_s
      end

      test "when the page is the index of a collection the permalink is the permalink of the indexed collection" do
        site = create_site
        create_collection(name: "posts", site: site)
        page = create_page(name: "posts", site: site)

        assert_equal "/posts/", page.permalink.to_s
      end

      test "by default uses the layout of the site" do
        site = create_site
        main_layout = create_layout(name: "main", site: site)
        page = create_page(site: site)

        assert_equal main_layout, page.layout
      end

      test "when in a collection uses the layout of the collection" do
        site = create_site
        collection = create_collection(name: "posts", site: site)
        post_layout = create_layout(name: "post", site: site)
        page = create_page(site: site, collection: collection)

        assert_equal post_layout, page.layout
      end

      test "a custom layout can be provided by metadata" do
        site = create_site
        custom_layout = create_layout(name: "custom", site: site)
        page = create_page(
          metadata: Resource::Metadata.new({"layout" => "custom"}),
          site: site
        )

        assert_equal custom_layout, page.layout
      end
    end
  end
end
