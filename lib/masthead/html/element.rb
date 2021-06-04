module Masthead
  module HTML
    class Element
      def initialize(tag_name, content = "", **attributes)
        @tag_name = tag_name
        @content = content
        @attributes = HTML::AttributeSet.new(attributes)
      end

      def to_s
        if void?
          opening_tag
        else
          "#{opening_tag}#{@content}#{closing_tag}"
        end
      end

      private

      VOID_ELEMENTS = ["br", "hr", "img", "link", "meta"]

      def opening_tag
        if @attributes.visible?
          "<#{@tag_name} #{@attributes.to_s}>"
        else
          "<#{@tag_name}>"
        end
      end

      def closing_tag
        "</#{@tag_name}>"
      end

      def void?
        VOID_ELEMENTS.include?(@tag_name)
      end
    end
  end
end
