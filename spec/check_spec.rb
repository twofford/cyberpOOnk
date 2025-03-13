# frozen_string_literal: true

RSpec.describe Check do
  describe '#roll' do
    let(:character) do
      Character.new(name: 'Johnny Silverhand', stats: Stats.new(brawn: 5), skills: Skills.new(athleticism: 5))
    end
    let(:check) do
      described_class.new(performer: character, difficulty_level: :easy, stat: :brawn, skill: :athleticism,
                          modifiers: [1, -2, 4])
    end

    before do
      allow(D20).to receive(:roll).and_return(10)
    end

    it 'sums the roll, character stat, character skill and modifiers' do
      expect(check.send(:roll)).to eq(23)
    end
  end

  describe '#calculate_degree_of_success' do
    let(:character) { Character.new(name: 'Johnny Silverhand', stats: Stats.new, skills: Skills.new) }
    let(:stat) { :brawn }
    let(:skill) { :athleticism }
    let(:modifiers) { [] }

    context 'when dl is easy' do
      let(:check) do
        described_class.new(performer: character, difficulty_level: :easy, stat: stat, skill: skill,
                            modifiers: modifiers)
      end

      it 'returns failure on a roll of 1-5' do
        (1..5).each do |i|
          allow(D20).to receive(:roll).and_return(i)
          expect(check.send(:calculate_degree_of_success)).to eq(:fail)
        end
      end

      it 'returns partial success on a roll of 6-15' do
        (6..15).each do |i|
          allow(D20).to receive(:roll).and_return(i)
          expect(check.send(:calculate_degree_of_success)).to eq(:partial)
        end
      end

      it 'returns full success on a roll of 16+' do
        (16..40).each do |i|
          allow(D20).to receive(:roll).and_return(i)
          expect(check.send(:calculate_degree_of_success)).to eq(:full)
        end
      end
    end

    context 'when dl is medium' do
      let(:check) do
        described_class.new(performer: character, difficulty_level: :medium, stat: stat, skill: skill,
                            modifiers: modifiers)
      end

      it 'returns failure on a roll of 1-10' do
        (1..10).each do |i|
          allow(D20).to receive(:roll).and_return(i)
          expect(check.send(:calculate_degree_of_success)).to eq(:fail)
        end
      end

      it 'returns partial success on a roll of 11-20' do
        (11..20).each do |i|
          allow(D20).to receive(:roll).and_return(i)
          expect(check.send(:calculate_degree_of_success)).to eq(:partial)
        end
      end

      it 'returns full success on a roll of 21+' do
        (21..40).each do |i|
          allow(D20).to receive(:roll).and_return(i)
          expect(check.send(:calculate_degree_of_success)).to eq(:full)
        end
      end
    end

    context 'when dl is hard' do
      let(:check) do
        described_class.new(performer: character, difficulty_level: :hard, stat: stat, skill: skill,
                            modifiers: modifiers)
      end

      it 'returns failure on a roll of 1-15' do
        (1..15).each do |i|
          allow(D20).to receive(:roll).and_return(i)
          expect(check.send(:calculate_degree_of_success)).to eq(:fail)
        end
      end

      it 'returns partial success on a roll of 16-25' do
        (16..25).each do |i|
          allow(D20).to receive(:roll).and_return(i)
          expect(check.send(:calculate_degree_of_success)).to eq(:partial)
        end
      end

      it 'returns full success on a roll of 26+' do
        (26..40).each do |i|
          allow(D20).to receive(:roll).and_return(i)
          expect(check.send(:calculate_degree_of_success)).to eq(:full)
        end
      end
    end

    context 'when dl is very hard' do
      let(:check) do
        described_class.new(performer: character, difficulty_level: :very_hard, stat: stat, skill: skill,
                            modifiers: modifiers)
      end

      it 'returns failure on a roll of 1-20' do
        (1..20).each do |i|
          allow(D20).to receive(:roll).and_return(i)
          expect(check.send(:calculate_degree_of_success)).to eq(:fail)
        end
      end

      it 'returns partial success on a roll of 21-30' do
        (21..30).each do |i|
          allow(D20).to receive(:roll).and_return(i)
          expect(check.send(:calculate_degree_of_success)).to eq(:partial)
        end
      end

      it 'returns full success on a roll of 31+' do
        (31..40).each do |i|
          allow(D20).to receive(:roll).and_return(i)
          expect(check.send(:calculate_degree_of_success)).to eq(:full)
        end
      end
    end

    context 'when dl is nigh impossible' do
      let(:check) do
        described_class.new(performer: character, difficulty_level: :nigh_impossible, stat: stat, skill: skill,
                            modifiers: modifiers)
      end

      it 'returns failure on a roll of 1-25' do
        (1..25).each do |i|
          allow(D20).to receive(:roll).and_return(i)
          expect(check.send(:calculate_degree_of_success)).to eq(:fail)
        end
      end

      it 'returns partial success on a roll of 26-35' do
        (26..35).each do |i|
          allow(D20).to receive(:roll).and_return(i)
          expect(check.send(:calculate_degree_of_success)).to eq(:partial)
        end
      end

      it 'returns full success on a roll of 36+' do
        (36..40).each do |i|
          allow(D20).to receive(:roll).and_return(i)
          expect(check.send(:calculate_degree_of_success)).to eq(:full)
        end
      end
    end
  end
end
