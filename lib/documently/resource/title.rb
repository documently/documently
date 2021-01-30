module Documently
  module Resource
    class Title
      def self.for(name)
        name.split("_").collect(&:capitalize).join(" ")
      end
    end
  end
end
