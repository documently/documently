require "test_helper"

module Documently
  module Resources
    class SiteTest < TestCase
      test "#build creates an artifact by building all the members" do
        site = create_site
        create_collection(site: site)
        create_page(site: site)

        artifact = site.build

        assert_equal 1, artifact.collections.count
        assert_equal 1, artifact.documents.count
      end

      test "the title is the titlecased name" do
        site = create_site(name: "blog")

        assert_equal "Blog", site.title
      end

      test "the permalink is a single slash" do
        site = create_site

        assert_equal "/", site.permalink.value
      end

      test "uses the layout named 'main'" do
        site = create_site
        main_layout = create_layout(name: "main", site: site)

        assert_equal main_layout, site.layout
      end
    end
  end
end
