module Masthead
  module Resources
    class Template
      module Engines
        class Text
          def call(source:, runtime:)
            runtime.content = source
          end
        end
      end
    end
  end
end
