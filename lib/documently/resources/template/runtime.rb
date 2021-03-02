module Documently
  module Resources
    class Template
      class Runtime
        attr_accessor :content

        def initialize(assigns: {})
          @content = nil
          @sections = {}
          @assigns = assigns
        end

        def content_for(section, content = nil)
          if content
            @sections[section] = content
          else
            @sections[section]
          end
        end

        def content_for?(section)
          @sections.include?(section)
        end

        def link_to(*args)
          Template::Helpers::Link.to(*args)
        end

        def date(*args)
          Template::Helpers::Date.element(*args)
        end

        def method_missing(name, *args, &block)
          if @assigns.include?(name)
            @assigns[name]
          else
            super
          end
        end

        def respond_to_missing?(name, include_private = false)
          @assigns.include?(name) || super
        end
      end
    end
  end
end
