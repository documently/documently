module Documently
  module Resources
    class Template
      module Engines
        class ERB
          def initialize
            @cache = {}
          end

          def call(source:, flow:, scope:)
            Evaluate.call(
              code: compile(source),
              flow: flow,
              scope: scope
            )
          end

          private

          def compile(source)
            @cache[source] ||= Erubi::Engine.new(source, bufvar: "@_output").src
          end

          class Evaluate
            def self.call(**kwargs)
              new(**kwargs).call
            end

            def initialize(code:, flow:, scope:)
              @_code = code
              @_flow = flow
              @_scope = scope
              @_output = ""
            end

            def call
              @_scope.infect(self)
              instance_eval(@_code)
              @_flow.main = @_output
            end

            def section(name, &block)
              @_flow.sections[name] = capture(&block)
            end

            def content
              @_flow.main
            end

            def content_for(section)
              @_flow.sections[section]
            end

            private

            def capture(&block)
              saved_output = @_output
              @_output = ""

              block.call

              captured_output = @_output
              @_output = saved_output

              captured_output
            end
          end
        end
      end
    end
  end
end
