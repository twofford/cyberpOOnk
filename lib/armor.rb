# frozen_string_literal: true

class Armor < Item
  attr_reader :dr

  alias damage_reduction dr

  def initialize(dr:)
    @dr = dr
  end
end
