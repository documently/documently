module Documently
  module Resource
    class Repository
      include Enumerable

      def self.empty
        new([])
      end

      def initialize(resources)
        @resources = resources
          .collect { |resource| [resource.name, resource] }
          .to_h
      end

      def find(name)
        @resources[name]
      end

      def include?(name)
        @resources.include?(name)
      end

      def <<(resource)
        @resources[resource.name] = resource
      end

      def each(&block)
        @resources.values.each(&block)
      end
    end
  end
end
