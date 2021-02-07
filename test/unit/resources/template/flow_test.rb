require "test_helper"

module Documently
  module Resources
    class Template
      class FlowTest < TestCase
        test "stores content in the main section" do
          flow = Template::Flow.new

          flow.main = "content"

          assert_equal "content", flow.main
        end

        test "overwrites content in the main section" do
          flow = Template::Flow.new

          flow.main = "old"
          flow.main = "new"

          assert_equal "new", flow.main
        end

        test "stores content in a named section" do
          flow = Template::Flow.new

          flow.sections[:section] = "content"

          assert_equal "content", flow.sections[:section]
        end

        test "doesn't overwrite content in a named section" do
          flow = Template::Flow.new

          flow.sections[:section] = "old"
          flow.sections[:section] = "new"

          assert_equal "old", flow.sections[:section]
        end
      end
    end
  end
end
