require "test_helper"

module Masthead
  module HTML
    class ElementTest < TestCase
      test "#to_s serializes a non-void element as the opening and closing tags" do
        element = HTML::Element.new("p")

        assert_equal "<p></p>", element.to_s
      end

      test "#to_s serializes a void element as just the opening tag" do
        element = HTML::Element.new("hr")

        assert_equal "<hr>", element.to_s
      end

      test "#to_s serializes an element with attributes" do
        element = HTML::Element.new("p", id: "element")

        assert_equal '<p id="element"></p>', element.to_s
      end

      test "#to_s serializes a non-void element with content" do
        element = HTML::Element.new("p", "content")

        assert_equal "<p>content</p>", element.to_s
      end

      test "#to_s serializes a non-void element with both content and attributes" do
        element = HTML::Element.new("p", "content", id: "element")

        assert_equal '<p id="element">content</p>', element.to_s
      end
    end
  end
end
