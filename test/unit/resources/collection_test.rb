require "test_helper"

module Documently
  module Resources
    class CollectionTest < TestCase
      test "the title is the titlecased name" do
        collection = build_collection(name: "posts")

        assert_equal "Posts", collection.title
      end

      test "the permalink is the slug joined to the parent with a trailing slash" do
        collection = build_collection(name: "posts")

        assert_equal "/posts/", collection.permalink.value
      end
    end
  end
end
