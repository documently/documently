module Masthead
  module Resource
    module Slug
      def self.for(name)
        name.tr("_", "-")
      end
    end
  end
end

