require "test_helper"

module Documently
  module Resources
    class SiteTest < TestCase
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
