module Masthead
  class TestCase < Minitest::Test
    module Macros
      def test(description, &block)
        underscored = description.tr(" ", "_")
        test_name = "test_#{underscored}"

        define_method(test_name, &block)
      end
    end
  end
end
