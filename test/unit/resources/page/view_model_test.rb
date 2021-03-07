require "test_helper"

module Documently
  module Resources
    class Page
      class ViewModelTest < TestCase
        test "accesses metadata with methods" do
          page = create_page(
            metadata: Resource::Metadata.new({author: "John Smith"})
          )
          view_model = Page::ViewModel.new(page)

          assert_equal "John Smith", view_model.author
        end

        test "delegates all other methods to the page" do
          page = create_page(name: "about")
          view_model = Page::ViewModel.new(page)

          assert_equal "about", view_model.name
        end
      end
    end
  end
end
