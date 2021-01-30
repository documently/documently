module Documently
  module Resources
    class Layout
      attr_reader :name

      def initialize(name:, metadata:, site:)
        @name = name
        @metadata = metadata
        @site = site
      end

      def layout
        if custom_layout?
          custom_layout
        elsif self == @site.layout
          nil
        else
          @site.layout
        end
      end

      private

      def custom_layout
        @site.layouts.find(@metadata[:layout])
      end

      def custom_layout?
        @metadata.include?(:layout)
      end
    end
  end
end
