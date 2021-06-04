module Masthead
  module Resource
    class Slug
      def self.for(name)
        name.tr("_", "-")
      end
    end
  end
end

