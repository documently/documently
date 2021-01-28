require "test_helper"

module Documently
  module Resources
    class SiteTest < TestCase
      test "the title is the titlecased name" do
        site = build_site(name: Resource::Name.new("blog"))

        assert_equal "Blog", site.title.value
      end

      test "the permalink is a single slash" do
        site = build_site

        assert_equal "/", site.permalink.value
      end
    end
  end
end
