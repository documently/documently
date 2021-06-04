module Masthead
  module Resource
    class Metadata
      def self.empty
        new({})
      end

      def initialize(values)
        @values = values
      end

      def [](name)
        @values[name]
      end

      def include?(name)
        @values.include?(name)
      end
    end
  end
end
