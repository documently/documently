require "test_helper"

module Documently
  module Resources
    class CollectionTest < TestCase
      test "the title is the titlecased name" do
        collection = create_collection(name: "posts")

        assert_equal "Posts", collection.title
      end

      test "the permalink is the slug joined to the parent with a trailing slash" do
        collection = create_collection(name: "posts")

        assert_equal "/posts/", collection.permalink.value
      end

      test "uses the layout with the singularized name of the collection" do
        site = create_site
        collection = create_collection(name: "posts", site: site)
        post_layout = create_layout(name: "post", site: site)

        assert_equal post_layout, collection.layout
      end

      test "if there is no layout with the singularized name of the collection, uses the site layout" do
        site = create_site
        collection = create_collection(name: "posts", site: site)
        main_layout = create_layout(name: "main", site: site)

        assert_equal main_layout, collection.layout
      end
    end
  end
end
