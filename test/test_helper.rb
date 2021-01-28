require_relative "support/coverage"

require "minitest/autorun"
require "purdytest"

require "documently"
require_relative "support/assertions"
require_relative "support/factories"
require_relative "support/macros"

module Documently
  class TestCase < Minitest::Test
    include Assertions, Factories
    extend Macros
  end
end
