# frozen_string_literal: true

class Cyberdeck < Item
  attr_reader :memory, :nouns, :verbs, :mods

  def initialize(memory:, nouns: [], verbs: [], mods: [])
    @memory = memory
    @nouns = nouns
    @verbs = verbs
    @mods = mods
  end
end
