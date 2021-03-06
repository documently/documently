require "test_helper"

module Documently
  module Resource
    class RepositoryTest < TestCase
      test "finds a resource by its name" do
        page = create_page(name: "page")
        repository = Resource::Repository.new([page])

        assert_equal page, repository.find("page")
      end

      test "determines whether it includes a resource with a given name" do
        page = create_page(name: "page")
        repository = Resource::Repository.new([page])

        assert repository.include?("page")
      end

      test "adds a resource" do
        repository = Resource::Repository.empty
        page = create_page(name: "page")

        repository << page

        assert repository.include?("page")
      end

      test "yields each resource" do
        page = create_page
        repository = Resource::Repository.new([page])

        yielded = nil

        repository.each do |p|
          yielded = p
        end

        assert_equal page, yielded
      end
    end
  end
end
