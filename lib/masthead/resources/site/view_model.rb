module Masthead
  module Resources
    class Site
      class ViewModel
        def initialize(site)
          @site = site
        end

        def method_missing(name, *args, &block)
          if include_member?(name.to_s)
            find_member(name.to_s)
          elsif @site.respond_to?(name)
            @site.public_send(name)
          else
            super
          end
        end

        def respond_to_missing?(name, include_private = false)
          include_member?(name.to_s) || @site.respond_to?(name) || super
        end

        private

        def find_member(name)
          @site.collections.find(name) || @site.pages.find(name)
        end

        def include_member?(name)
          @site.collections.include?(name) || @site.pages.include?(name)
        end
      end
    end
  end
end
