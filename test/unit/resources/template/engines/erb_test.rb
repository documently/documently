require "test_helper"

module Documently
  module Resources
    class Template
      module Engines
        class ERBTest < TestCase
          test "evaluates simple ERB" do
            engine = Template::Engines::ERB.new
            runtime = Template::Runtime.new

            engine.call(source: "<%= 'ERB' %>", runtime: runtime)

            assert_equal "ERB", runtime.content
          end

          test "evaluates ERB with assigns" do
            engine = Template::Engines::ERB.new
            runtime = Template::Runtime.new(assigns: {assign: "value"})

            engine.call(source: "<%= assign %>", runtime: runtime)

            assert_equal "value", runtime.content
          end

          test "stores content in a named section" do
            engine = Template::Engines::ERB.new
            runtime = Template::Runtime.new

            engine.call(
              source: "<% section :section do %>content<% end %>",
              runtime: runtime
            )

            assert_equal "content", runtime.content_for(:section)
          end

          test "outputs the main content" do
            engine = Template::Engines::ERB.new
            runtime = Template::Runtime.new

            runtime.content = "content"
            engine.call(source: "wrapped <%= content %>", runtime: runtime)

            assert_equal "wrapped content", runtime.content
          end

          test "outputs content from a named section" do
            engine = Template::Engines::ERB.new
            runtime = Template::Runtime.new

            runtime.content_for(:section, "content")
            engine.call(
              source: "wrapped <%= content_for :section %>",
              runtime: runtime
            )

            assert_equal "wrapped content", runtime.content
          end
        end
      end
    end
  end
end
