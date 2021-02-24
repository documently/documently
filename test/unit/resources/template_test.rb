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
          source: "<%= assign %>",
          engine: Template::Engines::ERB.new
        )

        assert_equal "value", template.render({assign: "value"})
      end
    end
  end
end
