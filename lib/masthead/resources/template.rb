module Masthead
  module Resources
    class Template
      def initialize(source:, engine:)
        @source = source
        @engine = engine
      end

      def render(assigns = {})
        runtime = Template::Runtime.new(assigns: assigns)
        render_in(runtime)
      end

      def render_in(runtime)
        @engine.call(source: @source, runtime: runtime)
        runtime.content
      end
    end
  end
end
