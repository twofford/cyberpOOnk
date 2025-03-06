# frozen_string_literal: true

class Cyberdeck < Item
  attr_reader :memory, :nouns, :verbs

  def initialize(memory:, nouns: [], verbs: [])
    type_check_arg(arg: memory, klass: Integer)
    type_check_arg(arg: nouns, klass: Symbol)
    type_check_arg(arg: verbs, klass: Symbol)

    @memory = memory
    @nouns = nouns
    @verbs = verbs
  end
end
