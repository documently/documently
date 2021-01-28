require "test_helper"

module Documently
  module Resource
    class SlugTest < TestCase
      test "creates a slug from a single-word name by using the name verbatim" do
        name = Resource::Name.new("about")
        slug = Resource::Slug.named(name)

        assert_equal "about", slug.value
      end

      test "creates a slug from a multi-word name by separating each word with a dash" do
        name = Resource::Name.new("contact_us")
        slug = Resource::Slug.named(name)

        assert_equal "contact-us", slug.value
      end
    end
  end
end

