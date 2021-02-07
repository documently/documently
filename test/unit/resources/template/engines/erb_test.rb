require "test_helper"

module Documently
  module Resources
    class Template
      module Engines
        class ERBTest < TestCase
          test "evaluates simple ERB" do
            engine = Template::Engines::ERB.new
            flow = Template::Flow.new
            scope = Template::Scope.new

            engine.call(source: "<%= 'ERB' %>", flow: flow, scope: scope)

            assert_equal "ERB", flow.main
          end

          test "evaluates ERB with assigns" do
            engine = Template::Engines::ERB.new
            flow = Template::Flow.new
            scope = Template::Scope.new({assign: "value"})

            engine.call(source: "<%= @assign %>", flow: flow, scope: scope)

            assert_equal "value", flow.main
          end

          test "stores content in a named section" do
            engine = Template::Engines::ERB.new
            flow = Template::Flow.new
            scope = Template::Scope.new

            engine.call(
              source: "<% section :section do %>content<% end %>",
              flow: flow,
              scope: scope
            )

            assert_equal "content", flow.sections[:section]
          end

          test "outputs the main content" do
            engine = Template::Engines::ERB.new
            flow = Template::Flow.new
            scope = Template::Scope.new

            flow.main = "content"
            engine.call(source: "wrapped <%= content %>", flow: flow, scope: scope)

            assert_equal "wrapped content", flow.main
          end

          test "outputs content from a named section" do
            engine = Template::Engines::ERB.new
            flow = Template::Flow.new
            scope = Template::Scope.new

            flow.sections[:section] = "content"
            engine.call(
              source: "wrapped <%= content_for :section %>",
              flow: flow,
              scope: scope
            )

            assert_equal "wrapped content", flow.main
          end
        end
      end
    end
  end
end
