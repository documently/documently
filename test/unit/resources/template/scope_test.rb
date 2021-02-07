require "test_helper"

module Documently
  module Resources
    class Template
      class ScopeTest < TestCase
        test "sets instance variables on an object" do
          object = Object.new
          scope = Template::Scope.new({assign: "value"})

          scope.infect(object)

          assert_equal "value", object.instance_variable_get(:@assign)
        end
      end
    end
  end
end
