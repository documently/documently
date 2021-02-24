require "test_helper"

module Documently
  module Resources
    class Template
      class RuntimeTest < TestCase
        test "stores and retrieves the main content" do
          runtime = Template::Runtime.new
          runtime.content = "content"

          assert_equal "content", runtime.content
        end

        test "stores and retrieves named sections" do
          runtime = Template::Runtime.new
          runtime.content_for(:section, "content")

          assert_equal "content", runtime.content_for(:section)
        end

        test "determines if a named section has content" do
          runtime = Template::Runtime.new
          runtime.content_for(:filled, "content")

          assert runtime.content_for?(:filled)
          assert_not runtime.content_for?(:empty)
        end

        test "makes assigns accessible with methods" do
          runtime = Template::Runtime.new(assigns: {assign: "value"})

          assert_equal "value", runtime.assign
        end
      end
    end
  end
end
