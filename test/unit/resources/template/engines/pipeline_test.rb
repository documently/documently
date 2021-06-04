require "test_helper"

module Masthead
  module Resources
    class Template
      module Engines
        class PipelineTest < TestCase
          test "passes the source to each engine in sequence after evaluation" do
            pipeline = Template::Engines::Pipeline.new([
              Template::Engines::ERB.new,
              Template::Engines::Markdown.new
            ])
            runtime = Template::Runtime.new

            pipeline.call(source: "# <%= 'Heading' %>", runtime: runtime)

            assert_equal "<h1 id=\"heading\">Heading</h1>\n", runtime.content
          end
        end
      end
    end
  end
end
