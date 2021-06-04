module Masthead
  module Resource
    class Title
      def self.for(name)
        name.split("_").map(&:capitalize).join(" ")
      end
    end
  end
end
