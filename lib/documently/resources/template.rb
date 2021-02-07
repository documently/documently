module Documently
  module Resources
    class Template
      attr_reader :parent

      def initialize(source:, engine:, parent: nil)
        @source = source
        @engine = engine
        @parent = parent
      end

      def render(assigns = {})
        flow = Template::Flow.new
        scope = Template::Scope.new(assigns)

        template = self

        until template.nil?
          template.render_self(flow, scope)
          template = template.parent
        end

        flow.main
      end

      def render_self(flow, scope)
        @engine.call(source: @source, flow: flow, scope: scope)
      end
    end
  end
end
