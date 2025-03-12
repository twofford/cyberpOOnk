# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Attack do
  let(:attacker)  { Character.random }
  let(:target)    { Character.random }
  let(:ammo)      { Ammo.new(damage_dice: D6, crit_multiplier: 2, quality: 0) }
  let(:weapon)    { Gun.new(ammo: ammo, max_range: 50, reliability: 0) }

  describe '#make' do
    it "raises an error if the weapon's max range is greater than the range to target" do
      attack = described_class.new(attacker: attacker, target: target, weapon: weapon, range_to_target: 100)
      expect { attack.make }.to raise_error(OutOfRangeError)
    end
  end

  describe '#calculate_difficulty_level' do
    context 'for attacks at range 0-15 feet' do
      it 'is easy' do
        attack = described_class.new(attacker: attacker, target: target, weapon: weapon, range_to_target: 15)
        expect(attack.send(:calculate_difficulty_level)).to eq(:easy)
      end
    end

    context 'for attacks at range 16-45 feet' do
      it 'is medium' do
        attack = described_class.new(attacker: attacker, target: target, weapon: weapon, range_to_target: 45)
        expect(attack.send(:calculate_difficulty_level)).to eq(:medium)
      end
    end

    context 'for attacks at range 46-75 feet' do
      it 'is hard' do
        attack = described_class.new(attacker: attacker, target: target, weapon: weapon, range_to_target: 75)
        expect(attack.send(:calculate_difficulty_level)).to eq(:hard)
      end
    end

    context 'for attacks at range 76-150 feet' do
      it 'is very hard' do
        attack = described_class.new(attacker: attacker, target: target, weapon: weapon, range_to_target: 150)
        expect(attack.send(:calculate_difficulty_level)).to eq(:very_hard)
      end
    end

    context 'for attacks at range 151-300 feet' do
      it 'is nigh impossible' do
        attack = described_class.new(attacker: attacker, target: target, weapon: weapon, range_to_target: 300)
        expect(attack.send(:calculate_difficulty_level)).to eq(:nigh_impossible)
      end
    end

    context 'for attacks at range 301+ feet' do
      it 'is impossible' do
        attack = described_class.new(attacker: attacker, target: target, weapon: weapon, range_to_target: 1000)
        expect(attack.send(:calculate_difficulty_level)).to eq(:impossible)
      end
    end
  end
end
