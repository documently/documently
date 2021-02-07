require "test_helper"

module Documently
  module Resources
    class Template
      module Engines
        class MarkdownTest < TestCase
          test "converts the source from markdown to HTML" do
            engine = Template::Engines::Markdown.new
            flow = Template::Flow.new
            scope = Template::Scope.new

            engine.call(source: "content", flow: flow, scope: scope)

            assert_equal "<p>content</p>\n", flow.main
          end
        end
      end
    end
  end
end
