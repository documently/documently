module Masthead
  module Resources
    class Template
      module Engines
        class ERB
          def initialize
            @cache = {}
          end

          def call(source:, runtime:)
            Evaluate.call(code: compile(source), runtime: runtime)
          end

          private

          def compile(source)
            @cache[source] ||= Erubi::Engine.new(source, bufvar: "@output").src
          end

          class Evaluate
            def self.call(**kwargs)
              new(**kwargs).call
            end

            def initialize(code:, runtime:)
              @code = code
              @runtime = runtime
            end

            def call
              call_with_section_yielding
            end

            def section(name, &block)
              @runtime.content_for(name, capture(&block))
            end

            def method_missing(name, *args, &block)
              if @runtime.respond_to?(name)
                @runtime.send(name, *args, &block)
              else
                super
              end
            end

            def respond_to_missing?(name, include_private = false)
              @runtime.respond_to?(name) || super
            end

            private

            def call_with_section_yielding
              call_without_section_yielding do |section = nil|
                if section
                  @runtime.content_for(section)
                else
                  @runtime.content
                end
              end
            end

            def call_without_section_yielding
              instance_eval(@code)
              @runtime.content = @output
            end

            def capture
              saved_output = @output
              @output = String.new

              yield

              captured_output = @output
              @output = saved_output

              captured_output
            end
          end
        end
      end
    end
  end
end
