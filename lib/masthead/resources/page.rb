module Masthead
  module Resources
    class Page
      attr_reader :name, :metadata

      def initialize(name:, metadata:, template:, site:, collection: nil)
        @name = name
        @metadata = metadata
        @template = template
        @site = site
        @collection = collection
      end

      def build
        Artifacts::Document.new(
          name: slug,
          content: @template.render({site: @site, page: self})
        )
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

      def method_missing(name, *args)
        if @metadata.include?(name.to_s)
          @metadata[name.to_s]
        else
          super
        end
      end

      def respond_to_missing?(name, include_private = false)
        @metadata.include?(name.to_s) || super
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
        if parent == @site && @name == "index"
          @site
        elsif @site.collections.include?(name)
          @site.collections.find(@name)
        end
      end

      def index?
        !indexed.nil?
      end

      def collected?
        !@collection.nil?
      end

      def custom_title
        @metadata["title"]
      end

      def custom_title?
        @metadata.include?("title")
      end

      def custom_layout
        @site.layouts.find(@metadata["layout"])
      end

      def custom_layout?
        @metadata.include?("layout")
      end
    end
  end
end
