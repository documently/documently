module Documently
  module Resources
    class Template
      module Engines
        class Text
          def call(source:, flow:, scope:)
            flow.main = source
          end
        end
      end
    end
  end
end
