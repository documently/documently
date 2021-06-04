require "test_helper"

module Masthead
  module Resources
    class Site
      class ViewModelTest < TestCase
        test "acceses pages by their name with methods" do
          site = create_site
          about_page = create_page(name: "about", site: site)
          view_model = Site::ViewModel.new(site)

          assert_equal about_page, view_model.about
        end

        test "acceses collections by their name with methods" do
          site = create_site
          posts = create_collection(name: "posts", site: site)
          view_model = Site::ViewModel.new(site)

          assert_equal posts, view_model.posts
        end

        test "prefers to access a collection over a page with the same name" do
          site = create_site
          posts_collection = create_collection(name: "posts", site: site)
          create_page(name: "posts", site: site)
          view_model = Site::ViewModel.new(site)

          assert_equal posts_collection, view_model.posts
        end

        test "delegates all other methods to the site" do
          site = create_site(name: "blog")
          view_model = Site::ViewModel.new(site)

          assert_equal "blog", view_model.name
        end
      end
    end
  end
end
