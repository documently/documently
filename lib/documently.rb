require "erubi"
require "kramdown"
require "kramdown-parser-gfm"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect "erb" => "ERB"
loader.setup

module Documently
end
