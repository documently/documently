module Documently
  module HTML
    class AttributeSet
      def self.empty
        new({})
      end

      def initialize(attributes)
        @attributes = attributes.collect { |name, value|
          HTML::Attribute.new(name, value)
        }
      end

      def visible?
        !to_s.empty?
      end

      def to_s
        @attributes.collect(&:to_s).join(" ")
      end
    end
  end
end
