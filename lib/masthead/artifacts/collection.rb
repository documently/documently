module Masthead
  module Artifacts
    class Collection
      attr_reader :name, :documents

      def initialize(name:, documents:)
        @name = name
        @documents = documents
      end
    end
  end
end
