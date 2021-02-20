module Documently
  module Resources
    class Template
      def initialize(source:, engine:)
        @source = source
        @engine = engine
      end

      def render(assigns = {})
        flow = Template::Flow.new
        scope = Template::Scope.new(assigns)

        @engine.call(source: @source, flow: flow, scope: scope)

        flow.main
      end
    end
  end
end
