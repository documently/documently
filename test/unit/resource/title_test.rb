require "test_helper"

module Documently
  module Resource
    class TitleTest < TestCase
      test "creates a title from a single-word name by capitalizing the word" do
        name = Resource::Name.new("about")
        title = Resource::Title.named(name)

        assert_equal "About", title.value
      end

      test "creates a title from a multi-word name by capitalizing each word" do
        name = Resource::Name.new("contact_us")
        title = Resource::Title.named(name)

        assert_equal "Contact Us", title.value
      end
    end
  end
end
