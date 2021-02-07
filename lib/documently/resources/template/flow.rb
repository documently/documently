module Documently
  module Resources
    class Template
      class Flow
        attr_reader :sections
        attr_accessor :main

        def initialize
          @main = nil
          @sections = Sections.new
        end

        private

        class Sections
          def initialize
            @sections = {}
          end

          def [](section)
            @sections[section]
          end

          def []=(section, content)
            if !@sections.include?(section)
              @sections[section] = content
            end
          end
        end
      end
    end
  end
end
