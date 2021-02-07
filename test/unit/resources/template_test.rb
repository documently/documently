require "test_helper"

module Documently
  module Resources
    class TemplateTest < TestCase
      test "renders by evaluating the source with the engine" do
        template = Template.new(
          source: "content",
          engine: Template::Engines::Markdown.new
        )

        assert_equal "<p>content</p>\n", template.render
      end

      test "renders with assigns" do
        template = Template.new(
          source: "<%= @assign %>",
          engine: Template::Engines::ERB.new
        )

        assert_equal "value", template.render({assign: "value"})
      end

      test "passes the main section up the render chain" do
        parent = Template.new(
          source: "parent <%= content %>",
          engine: Template::Engines::ERB.new
        )
        child = Template.new(
          source: "child",
          engine: Template::Engines::Text.new,
          parent: parent
        )

        assert_equal "parent child", child.render
      end

      test "passes named sections up the render chain" do
        parent = Template.new(
          source: "parent <%= content_for :section %>",
          engine: Template::Engines::ERB.new
        )
        child = Template.new(
          source: "<% section :section do %>child<% end %>",
          engine: Template::Engines::ERB.new,
          parent: parent
        )

        assert_equal "parent child", child.render
      end
    end
  end
end
