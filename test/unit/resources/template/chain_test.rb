require "test_helper"

module Masthead
  module Resources
    class Template
      class ChainTest < TestCase
        test "passes the main section up to each successive template" do
          child = Template.new(
            source: "child",
            engine: Template::Engines::Text.new
          )
          parent = Template.new(
            source: "parent <%= yield %>",
            engine: Template::Engines::ERB.new
          )
          chain = Template::Chain.new([child, parent])

          assert_equal "parent child", chain.render
        end

        test "passes named sections up to each successive template" do
          child = Template.new(
            source: "<% section :section do %>child<% end %>",
            engine: Template::Engines::ERB.new
          )
          parent = Template.new(
            source: "parent <%= yield :section %>",
            engine: Template::Engines::ERB.new
          )
          chain = Template::Chain.new([child, parent])

          assert_equal "parent child", chain.render
        end

        test "passes assigns to each template" do
          child = Template.new(
            source: "<%= assign %>",
            engine: Template::Engines::ERB.new
          )
          parent = Template.new(
            source: "<%= assign %> <%= yield %>",
            engine: Template::Engines::ERB.new
          )
          chain = Template::Chain.new([child, parent])

          assert_equal "value value", chain.render({assign: "value"})
        end
      end
    end
  end
end
