module Documently
  module Resources
    class Site
      attr_reader :name, :pages, :collections

      def initialize(
        name:,
        pages: Resource::Repository.empty,
        collections: Resource::Repository.empty
      )
        @name = name
        @pages = pages
        @collections = collections
      end

      def title
        Resource::Title.for(@name)
      end

      def permalink
        Resource::Permalink.root
      end
    end
  end
end
