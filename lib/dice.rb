# frozen_string_literal: true

require 'pry'
class Die
  attr_reader :size

  def initialize(size:)
    @size = size
  end

  def roll
    rand(1..size)
  end

  def *(other)
    Array.new(other) { self.class.new }
  end

  def self.roll
    rand(1..new.size)
  end

  def self.coerce(other)
    [new, other]
  end
end

class D4 < Die
  def initialize
    super(size: 4)
  end
end

class D6 < Die
  def initialize
    super(size: 6)
  end
end

class D8 < Die
  def initialize
    super(size: 8)
  end
end

class D10 < Die
  def initialize
    super(size: 10)
  end
end

class D12 < Die
  def initialize
    super(size: 12)
  end
end

class D20 < Die
  def initialize
    super(size: 20)
  end
end

class D100 < Die
  def initialize
    super(size: 100)
  end
end
