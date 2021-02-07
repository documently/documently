module Documently
  module Resources
    class Template
      class Scope
        def initialize(assigns = {})
          @assigns = assigns
        end

        def infect(object)
          @assigns.each do |name, value|
            object.instance_variable_set(:"@#{name}", value)
          end
        end
      end
    end
  end
end
