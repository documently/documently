module Masthead
  module HTML
    class Attribute
      def initialize(name, value)
        @name = name
        @value = value
      end

      def to_s
        case @value
        when TrueClass then "#{@name}"
        when FalseClass then ""
        else "#{@name}=\"#{@value}\""
        end
      end
    end
  end
end
