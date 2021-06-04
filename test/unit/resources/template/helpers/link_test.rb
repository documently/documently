require "test_helper"
require "ostruct"

module Masthead
  module Resources
    class Template
      module Helpers
        class LinkTest < TestCase
          test "creates an anchor tag for a resource with a permalink and a title" do
            resource = OpenStruct.new(
              title: "Title",
              permalink: Resource::Permalink.new("/")
            )

            link = Template::Helpers::Link.to(resource)

            assert_equal '<a href="/">Title</a>', link
          end

          test "passes through attributes to the anchor tag" do
            resource = OpenStruct.new(
              title: "Title",
              permalink: Resource::Permalink.new("/")
            )

            link = Template::Helpers::Link.to(resource, id: "element")

            assert_equal '<a id="element" href="/">Title</a>', link
          end

          test "passes through content to the anchor tag" do
            resource = OpenStruct.new(
              title: "Title",
              permalink: Resource::Permalink.new("/")
            )

            link = Template::Helpers::Link.to(resource, "Custom Title")

            assert_equal '<a href="/">Custom Title</a>', link
          end
        end
      end
    end
  end
end
