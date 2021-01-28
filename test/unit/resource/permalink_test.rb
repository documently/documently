require "test_helper"

module Documently
  module Resource
    class PermalinkTest < TestCase
      test "creates a root permalink that is a single slash" do
        assert_equal "/", Resource::Permalink.root.value
      end

      test "joins a slug" do
        permalink = Resource::Permalink.new("/posts/")
        slug = Resource::Slug.new("example-post")

        assert_equal "/posts/example-post", permalink.join(slug).value
      end
      
      test "ensures that it ends with a slash" do
        with_trailing_slash = Resource::Permalink.new("/posts/")
        without_trailing_slash = Resource::Permalink.new("/posts")

        assert_equal "/posts/", with_trailing_slash.ensure_trailing_slash.value
        assert_equal "/posts/", without_trailing_slash.ensure_trailing_slash.value
      end
    end
  end
end
