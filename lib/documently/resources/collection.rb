module Documently
  module Resources
    class Collection
      attr_reader :name, :pages

      def initialize(name:, site:, pages: Resource::Repository.empty)
        @name = name
        @site = site
        @pages = pages
      end

      def title
        Resource::Title.for(@name)
      end

      def permalink
        @site.permalink.join(slug).ensure_trailing_slash
      end

      def layout
        singularized = Inflector.singularize(@name)

        if @site.layouts.include?(singularized)
          @site.layouts.find(singularized)
        else
          @site.layout
        end
      end

      private

      def slug
        Resource::Slug.for(@name)
      end
    end
  end
end
