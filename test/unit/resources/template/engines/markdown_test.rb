require "test_helper"

module Documently
  module Resources
    class Template
      module Engines
        class MarkdownTest < TestCase
          test "converts the source from markdown to HTML" do
            engine = Template::Engines::Markdown.new
            runtime = Template::Runtime.new

            engine.call(source: "content", runtime: runtime)

            assert_equal "<p>content</p>\n", runtime.content
          end
        end
      end
    end
  end
end
