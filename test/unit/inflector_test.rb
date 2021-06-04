require "test_helper"

module Masthead
  class InflectorTest < TestCase
    test "singularizes a plural word" do
      assert_equal "post", Inflector.singularize("posts")
    end

    test "singularizes a singular word by returning the word verbatim" do
      assert_equal "tutorial", Inflector.singularize("tutorial")
    end
  end
end
