module Documently
  module Resources
    class Template
      module Engines
        class Pipeline
          def initialize(engines)
            @engines = engines
          end

          def call(source:, runtime:)
            @engines.each do |engine|
              engine.call(source: source, runtime: runtime)
              source = runtime.content
            end
          end
        end
      end
    end
  end
end
