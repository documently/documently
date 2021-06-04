module Masthead
  class TestCase < Minitest::Test
    module Assertions
      def self.included(base)
        base.alias_method :assert_not, :refute
      end
    end
  end
end
