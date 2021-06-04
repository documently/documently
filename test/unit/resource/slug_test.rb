require "test_helper"

module Masthead
  module Resource
    class SlugTest < TestCase
      test "creates a slug from a single-word name by using the name verbatim" do
        assert_equal "about", Resource::Slug.for("about")
      end

      test "creates a slug from a multi-word name by separating each word with a dash" do
        assert_equal "contact-us", Resource::Slug.for("contact_us")
      end
    end
  end
end

