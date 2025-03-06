# frozen_string_literal: true

class Cyberdeck < Item
  attr_reader :memory, :nouns, :verbs

  def initialize(memory:, nouns: [], verbs: [])
    @memory = memory
    @nouns = nouns
    @verbs = verbs
  end
end
