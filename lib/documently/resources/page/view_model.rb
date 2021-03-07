module Documently
  module Resources
    class Page
      class ViewModel
        def initialize(page)
          @page = page
        end

        def method_missing(name, *args, &block)
          if @page.metadata.include?(name)
            @page.metadata[name]
          elsif @page.respond_to?(name)
            @page.public_send(name)
          else
            super
          end
        end

        def respond_to_missing?(name, include_private = false)
          @page.metadata.include?(name) || @page.respond_to?(name) || super
        end
      end
    end
  end
end
