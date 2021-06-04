require "test_helper"

module Masthead
  module Resources
    class Template
      module Engines
        class TextTest < TestCase
          test "evaluates the source verbatim" do
            engine = Template::Engines::Text.new
            runtime = Template::Runtime.new

            engine.call(source: "content", runtime: runtime)

            assert_equal "content", runtime.content
          end
        end
      end
    end
  end
end
