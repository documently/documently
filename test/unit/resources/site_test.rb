require "test_helper"

module Documently
  module Resources
    class SiteTest < TestCase
      test "the title is the titlecased name" do
        site = build_site(name: "blog")

        assert_equal "Blog", site.title
      end

      test "the permalink is a single slash" do
        site = build_site

        assert_equal "/", site.permalink.value
      end

      test "uses the layout named 'main'" do
        site = build_site
        main_layout = build_layout(name: "main", site: site)

        assert_equal main_layout, site.layout
      end
    end
  end
end
