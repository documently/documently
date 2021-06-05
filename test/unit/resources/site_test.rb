require "test_helper"

module Masthead
  module Resources
    class SiteTest < TestCase
      test "#build creates an artifact by building all the members" do
        site = create_site
        create_collection(site: site)
        create_page(site: site)

        artifact = site.build

        assert_equal 1, artifact.collections.count
        assert_equal 1, artifact.documents.count
      end

      test "the title is the titlecased name" do
        site = create_site(name: "blog")

        assert_equal "Blog", site.title
      end

      test "the permalink is a single slash" do
        site = create_site

        assert_equal "/", site.permalink.to_s
      end

      test "uses the layout named 'main'" do
        site = create_site
        main_layout = create_layout(name: "main", site: site)

        assert_equal main_layout, site.layout
      end

      test "acceses pages by their name with methods" do
        site = create_site
        about_page = create_page(name: "about", site: site)

        assert_equal about_page, site.about
      end

      test "acceses collections by their name with methods" do
        site = create_site
        posts = create_collection(name: "posts", site: site)

        assert_equal posts, site.posts
      end

      test "prefers to access a collection over a page with the same name" do
        site = create_site
        posts_collection = create_collection(name: "posts", site: site)
        create_page(name: "posts", site: site)

        assert_equal posts_collection, site.posts
      end
    end
  end
end
