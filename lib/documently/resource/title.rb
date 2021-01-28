module Documently
  module Resource
    class Title
      attr_reader :value

      def self.named(name)
        new(
          name.value.split("_").collect(&:capitalize).join(" ")
        )
      end

      def initialize(value)
        @value = value
      end

      def to_s
        @value
      end
    end
  end
end
