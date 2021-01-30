module Documently
  module Resource
    class Permalink
      attr_reader :value

      def self.root
        new("/")
      end

      def initialize(value)
        @value = value
      end

      def join(slug)
        Resource::Permalink.new(value_with_trailing_slash + slug)
      end

      def ensure_trailing_slash
        Resource::Permalink.new(value_with_trailing_slash)
      end

      def to_s
        @value
      end

      private

      def value_with_trailing_slash
        if @value.end_with?("/")
          @value
        else
          @value + "/"
        end
      end
    end
  end
end
