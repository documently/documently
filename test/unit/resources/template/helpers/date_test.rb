require "test_helper"

module Masthead
  module Resources
    class Template
      module Helpers
        class DateTest < TestCase
          test "creates a <time> element containing both the ISO formatted date and the human readable date" do
            march_2_2021 = ::Date.new(2021, 3, 2)

            element = Template::Helpers::Date.element(march_2_2021)

            assert_equal '<time datetime="2021-03-02">March 2, 2021</time>', element
          end
        end
      end
    end
  end
end
