# stdlib
require "date"

# external
require "erubi"
require "kramdown"
require "kramdown-parser-gfm"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect "erb" => "ERB"
loader.inflector.inflect "html" => "HTML"
loader.setup

module Documently
end
