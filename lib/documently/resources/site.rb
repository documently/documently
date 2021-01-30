module Documently
  module Resources
    class Site
      attr_reader :name, :pages, :collections, :layouts

      def initialize(
        name:,
        pages: Resource::Repository.empty,
        collections: Resource::Repository.empty,
        layouts: Resource::Repository.empty
      )
        @name = name
        @pages = pages
        @collections = collections
        @layouts = layouts
      end

      def title
        Resource::Title.for(@name)
      end

      def permalink
        Resource::Permalink.root
      end

      def layout
        @layouts.find("main")
      end
    end
  end
end
