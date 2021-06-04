require "test_helper"

module Masthead
  module HTML
    class AttributeTest < TestCase
      test "#to_s serializes a string attribute as a key-value pair" do
        attribute = HTML::Attribute.new(:id, "element")

        assert_equal 'id="element"', attribute.to_s
      end

      test "#to_s serializes true as the attribute name" do
        attribute = HTML::Attribute.new(:hidden, true)

        assert_equal "hidden", attribute.to_s
      end

      test "#to_s serializes false as an empty string" do
        attribute = HTML::Attribute.new(:hidden, false)

        assert_equal "", attribute.to_s
      end
    end
  end
end
