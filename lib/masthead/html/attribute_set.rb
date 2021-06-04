module Masthead
  module HTML
    class AttributeSet
      def self.empty
        new({})
      end

      def initialize(attributes)
        @attributes = attributes.map { |name, value|
          HTML::Attribute.new(name, value)
        }
      end

      def visible?
        !to_s.empty?
      end

      def to_s
        @attributes.map(&:to_s).join(" ")
      end
    end
  end
end
