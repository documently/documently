module Documently
  module Resources
    class Page
      attr_reader :name

      def initialize(name:, metadata:, site:, collection: nil)
        @name = name
        @metadata = metadata
        @site = site
        @collection = collection
      end

      def title
        if custom_title?
          custom_title
        elsif index?
          indexed.title
        else
          Resource::Title.for(@name)
        end
      end

      def permalink
        if index?
          indexed.permalink
        else
          parent.permalink.join(slug)
        end
      end

      def layout
        if custom_layout?
          custom_layout
        else
          parent.layout
        end
      end

      private

      def slug
        Resource::Slug.for(@name)
      end

      def parent
        if collected?
          @collection
        else
          @site
        end
      end

      def indexed
        if site_index?
          @site
        elsif collection_index?
          @site.collections.find(@name)
        end
      end

      def index?
        site_index? || collection_index?
      end

      def collected?
        !@collection.nil?
      end

      def site_index?
        name == "index" && !collected?
      end

      def collection_index?
        @site.collections.include?(name)
      end

      def custom_title
        @metadata[:title]
      end

      def custom_title?
        @metadata.include?(:title)
      end

      def custom_layout
        @site.layouts.find(@metadata[:layout])
      end

      def custom_layout?
        @metadata.include?(:layout)
      end
    end
  end
end
