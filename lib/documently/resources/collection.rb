module Documently
  module Resources
    class Collection
      attr_reader :name

      def initialize(name:, site:)
        @name = name
        @site = site
      end

      def title
        Resource::Title.named(@name)
      end

      def permalink
        @site.permalink.join(slug).ensure_trailing_slash
      end

      private

      def slug
        Resource::Slug.named(@name)
      end
    end
  end
end
