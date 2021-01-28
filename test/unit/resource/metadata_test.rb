require "test_helper"

module Documently
  module Resource
    class MetadataTest < TestCase
      test "accesses a piece of metadata by its name" do
        metadata = Resource::Metadata.new({author: "John Smith"})

        assert_equal "John Smith", metadata[:author]
      end

      test "determines if a piece of metadata exists" do
        metadata = Resource::Metadata.new({author: "John Smith"})

        assert metadata.include?(:author)
        assert_not metadata.include?(:unknown)
      end
    end
  end
end
