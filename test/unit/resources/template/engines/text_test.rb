require "test_helper"

module Documently
  module Resources
    class Template
      module Engines
        class TextTest < TestCase
          test "evaluates the source verbatim" do
            engine = Template::Engines::Text.new
            flow = Template::Flow.new
            scope = Template::Scope.new

            engine.call(source: "content", flow: flow, scope: scope)

            assert_equal "content", flow.main
          end
        end
      end
    end
  end
end
