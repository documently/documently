module Masthead
  module Resources
    class Template
      class Chain
        def initialize(templates)
          @templates = templates
        end

        def render(assigns = {})
          runtime = Template::Runtime.new(assigns: assigns)

          @templates.each do |template|
            template.render_in(runtime)
          end

          runtime.content
        end
      end
    end
  end
end
