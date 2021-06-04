require "test_helper"

module Masthead
  module Resources
    class LayoutTest < TestCase
      test "by default uses the site layout" do
        site = create_site
        main_layout = create_layout(name: "main", site: site)
        post_layout = create_layout(name: "post", site: site)

        assert_equal main_layout, post_layout.layout
      end

      test "the site layout uses no layout" do
        main_layout = create_layout(name: "main")

        assert_nil main_layout.layout
      end

      test "a custom layout can be provided by metadata" do
        site = create_site
        custom_layout = create_layout(name: "custom", site: site)
        uses_custom_layout = create_layout(
          name: "uses_custom_layout",
          metadata: Resource::Metadata.new({"layout" => "custom"}),
          site: site
        )

        assert_equal custom_layout, uses_custom_layout.layout
      end
    end
  end
end
