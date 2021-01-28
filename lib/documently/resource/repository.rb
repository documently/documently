module Documently
  module Resource
    class Repository
      include Enumerable

      def self.empty
        new([])
      end

      def initialize(resources)
        @resources = resources
          .collect { |resource| [resource.name.value, resource] }
          .to_h
      end

      def find(name)
        @resources[name.value]
      end

      def include?(name)
        @resources.include?(name.value)
      end

      def <<(resource)
        @resources[resource.name.value] = resource
      end

      def each(&block)
        @resources.values.each(&block)
      end
    end
  end
end
