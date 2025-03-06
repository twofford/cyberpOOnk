# frozen_string_literal: true

class Armor < Item
  attr_reader :dr

  alias damage_reduction dr

  def initialize(dr:)
    type_check_arg(arg: dr, klass: Integer)

    @dr = dr
  end
end
