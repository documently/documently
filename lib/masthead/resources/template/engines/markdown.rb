module Masthead
  module Resources
    class Template
      module Engines
        class Markdown
          def initialize
            @cache = {}
          end

          def call(source:, runtime:)
            runtime.content = parse(source)
          end

          private

          def parse(source)
            @cache[source] ||= Kramdown::Document.new(source, input: "GFM").to_html
          end
        end
      end
    end
  end
end
