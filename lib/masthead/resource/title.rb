module Masthead
  module Resource
    module Title
      def self.for(name)
        name.split("_").map(&:capitalize).join(" ")
      end
    end
  end
end
