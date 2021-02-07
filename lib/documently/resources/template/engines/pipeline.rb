module Documently
  module Resources
    class Template
      module Engines
        class Pipeline
          def initialize(engines)
            @engines = engines
          end

          def call(source:, flow:, scope:)
            @engines.each do |engine|
              engine.call(source: source, flow: flow, scope: scope)
              source = flow.main
            end
          end
        end
      end
    end
  end
end
