require "test_helper"

module Masthead
  module Resource
    class PermalinkTest < TestCase
      test "creates a root permalink that is a single slash" do
        assert_equal "/", Resource::Permalink.root.to_s
      end

      test "joins a slug" do
        permalink = Resource::Permalink.new("/posts/")

        assert_equal "/posts/example-post", permalink.join("example-post").to_s
      end

      test "ensures that it ends with a slash" do
        with_trailing_slash = Resource::Permalink.new("/posts/")
        without_trailing_slash = Resource::Permalink.new("/posts")

        assert_equal "/posts/", with_trailing_slash.ensure_trailing_slash.to_s
        assert_equal "/posts/", without_trailing_slash.ensure_trailing_slash.to_s
      end
    end
  end
end
