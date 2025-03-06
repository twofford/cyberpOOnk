# frozen_string_literal: true

class Item
  attr_reader :price

  def initialize
    @price = calculate_price

    type_check_arg(arg: price, klass: Integer)
  end

  def calculate_price
    raise NotImplementedError
  end
end
