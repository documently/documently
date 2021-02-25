require "test_helper"

module Documently
  module HTML
    class AttributeSetTest < TestCase
      test "#to_s serializes all the attributes separated by spaces" do
        attributes = HTML::AttributeSet.new(id: "element", hidden: true)

        assert_equal 'id="element" hidden', attributes.to_s
      end

      test "#to_s serializes as an empty string when empty" do
        attributes = HTML::AttributeSet.empty

        assert_equal "", attributes.to_s
      end

      test "#visible? determines whether the attributes will be visible when serialized" do
        visible = HTML::AttributeSet.new(id: "element")
        invisible = HTML::AttributeSet.new(hidden: false)
        empty = HTML::AttributeSet.empty

        assert visible.visible?
        assert_not invisible.visible?
        assert_not empty.visible?
      end
    end
  end
end
