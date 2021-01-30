require "test_helper"

module Documently
  module Resource
    class TitleTest < TestCase
      test "creates a title from a single-word name by capitalizing the word" do
        assert_equal "About", Resource::Title.for("about")
      end

      test "creates a title from a multi-word name by capitalizing each word" do
        assert_equal "Contact Us", Resource::Title.for("contact_us")
      end
    end
  end
end
