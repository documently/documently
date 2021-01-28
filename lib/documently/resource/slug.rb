module Documently
  module Resource
    class Slug
      attr_reader :value

      def self.named(name)
        new(
          name.value.tr("_", "-")
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

