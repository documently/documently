require_relative "support/coverage"

require "minitest/autorun"
require "purdytest"

require "documently"
require_relative "support/assertions"
require_relative "support/macros"

module Documently
  class TestCase < Minitest::Test
    include Assertions
    extend Macros
  end
end
