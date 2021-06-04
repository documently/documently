module Masthead
  module Artifacts
    class Site
      attr_reader :documents, :collections

      def initialize(documents:, collections:)
        @documents = documents
        @collections = collections
      end
    end
  end
end
