require "test_helper"

module Documently
  module Resources
    class Template
      module Engines
        class PipelineTest < TestCase
          test "passes the source to each engine in sequence after evaluation" do
            pipeline = Template::Engines::Pipeline.new([
              Template::Engines::ERB.new,
              Template::Engines::Markdown.new
            ])
            flow = Template::Flow.new
            scope = Template::Scope.new

            pipeline.call(source: "# <%= 'Heading' %>", flow: flow, scope: scope)

            assert_equal "<h1 id=\"heading\">Heading</h1>\n", flow.main
          end
        end
      end
    end
  end
end
