module Masthead
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

      def build
        Artifacts::Site.new(
          documents: @pages.map(&:build),
          collections: @collections.map(&:build)
        )
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

      def method_missing(name, *args)
        if include_member?(name.to_s)
          find_member(name.to_s)
        else
          super
        end
      end

      private

      def find_member(name)
        @collections.find(name) || @pages.find(name)
      end

      def include_member?(name)
        @collections.include?(name) || @pages.include?(name)
      end
    end
  end
end
