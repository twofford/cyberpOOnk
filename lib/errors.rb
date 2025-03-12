# frozen_string_literal: true

class GameError < StandardError
end

class OutOfRangeError < GameError
end

class MisfireError < GameError
end

class UnknownDifficultyLevelError < GameError
end

class UnknownDegreeOfSuccessError < GameError
end

class UnknownWeaponTypeError < GameError
end

class UnknownCoverTypeError < GameError
end
