module Documently
  module Resources
    class Template
      module Helpers
        class Link
          def self.to(resource, content = resource.title, **attributes)
            attributes[:href] = resource.permalink.to_s

            HTML::Element.new("a", content, **attributes).to_s
          end
        end
      end
    end
  end
end
