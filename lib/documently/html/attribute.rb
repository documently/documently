module Documently
  module HTML
    class Attribute
      def initialize(name, value)
        @name = name
        @value = value
      end

      def to_s
        case @value
        when String then "#{@name}=\"#{@value}\""
        when TrueClass then "#{@name}"
        when FalseClass then ""
        end
      end
    end
  end
end
