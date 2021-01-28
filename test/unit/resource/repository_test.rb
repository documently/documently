require "test_helper"

module Documently
  module Resource
    class RepositoryTest < TestCase
      test "finds a resource by its name" do
        page = build_page
        repository = Resource::Repository.new([page])

        assert_equal page, repository.find(page.name)
      end

      test "determines whether it includes a resource with a given name" do
        page = build_page
        repository = Resource::Repository.new([page])

        assert repository.include?(page.name)
      end

      test "adds a resource" do
        repository = Resource::Repository.empty
        page = build_page

        repository << page

        assert repository.include?(page.name)
      end

      test "yields each resource" do
        page = build_page
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
