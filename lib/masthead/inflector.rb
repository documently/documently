module Masthead
  class Inflector
    def self.singularize(word)
      if word.end_with?("s")
        word[0..word.length - 2]
      else
        word
      end
    end
  end
end
