module Documently
  module Artifacts
    class Document
      attr_reader :name, :content

      def initialize(name:, content:)
        @name = name
        @content = content
      end
    end
  end
end
