module Documently
  module Resources
    class Template
      module Helpers
        class Date
          def self.element(date)
            iso = date.strftime("%F")
            human_readable = date.strftime("%B %-d, %Y")

            HTML::Element.new("time", human_readable, datetime: iso).to_s
          end
        end
      end
    end
  end
end
