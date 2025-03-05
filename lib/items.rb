# frozen_string_literal: true

class Item
  attr_reader :price

  def initialize
    @price = calculate_price
  end

  # def set_price
  #   @price = calculate_price
  # end

  def calculate_price
    raise NotImplementedError
  end
end

class Armor < Item
  attr_reader :dr

  def initialize(dr:)
    @dr = dr
  end
end

class Cyberdeck < Item
  attr_reader :memory, :nouns, :verbs

  def initialize(memory:, nouns: [], verbs: [])
    @memory = memory
    @nouns = nouns
    @verbs = verbs
  end
end
