# frozen_string_literal: true

RSpec.describe Check do
  describe '#roll' do
    let(:stats) { Stats.new(brawn: 5) }
    let(:skills) { Skills.new(athleticism: 5) }
    let(:character) { Character.new(name: 'Johnny Silverhand', stats: stats, skills: skills) }
    let(:dl) { :easy }
    let(:stat) { :brawn }
    let(:skill) { :athleticism }
    let(:modifiers) { [1, -2, 4] }
    let(:check) do
      described_class.new(performer: character, difficulty_level: dl, stat: stat, skill: skill,
                          modifiers: modifiers)
    end

    before do
      allow(D20).to receive(:roll).and_return(10)
    end

    it 'sums the roll, character stat, character skill and modifiers' do
      expect(check.send(:roll)).to eq(23)
    end
  end

  describe '#calculate_degree_of_success' do
    let(:stats) { Stats.new }
    let(:skills) { Skills.new }
    let(:character) { Character.new(name: 'Johnny Silverhand', stats: stats, skills: skills) }
    let(:stat) { :brawn }
    let(:skill) { :athleticism }
    let(:modifiers) { [] }

    context 'easy dl' do
      let(:dl) { :easy }
      let(:check) do
        described_class.new(performer: character, difficulty_level: dl, stat: stat, skill: skill,
                            modifiers: modifiers)
      end

      context 'rolls 1-5' do
        it 'returns failure' do
          (1..5).each do |i|
            allow(D20).to receive(:roll).and_return(i)
            expect(check.send(:calculate_degree_of_success)).to eq(:fail)
          end
        end
      end

      context 'rolls 6-15' do
        it 'returns partial success' do
          (6..15).each do |i|
            allow(D20).to receive(:roll).and_return(i)
            expect(check.send(:calculate_degree_of_success)).to eq(:partial)
          end
        end
      end

      context 'rolls 16+' do
        it 'returns full success' do
          (16..40).each do |i|
            allow(D20).to receive(:roll).and_return(i)
            expect(check.send(:calculate_degree_of_success)).to eq(:full)
          end
        end
      end
    end

    context 'medium dl' do
      let(:dl) { :medium }
      let(:check) do
        described_class.new(performer: character, difficulty_level: dl, stat: stat, skill: skill,
                            modifiers: modifiers)
      end

      context 'rolls 1-10' do
        it 'returns failure' do
          (1..10).each do |i|
            allow(D20).to receive(:roll).and_return(i)
            expect(check.send(:calculate_degree_of_success)).to eq(:fail)
          end
        end
      end

      context 'rolls 11-20' do
        it 'returns partial success' do
          (11..20).each do |i|
            allow(D20).to receive(:roll).and_return(i)
            expect(check.send(:calculate_degree_of_success)).to eq(:partial)
          end
        end
      end

      context 'rolls 21+' do
        it 'returns full success' do
          (21..40).each do |i|
            allow(D20).to receive(:roll).and_return(i)
            expect(check.send(:calculate_degree_of_success)).to eq(:full)
          end
        end
      end
    end

    context 'hard dl' do
      let(:dl) { :hard }
      let(:check) do
        described_class.new(performer: character, difficulty_level: dl, stat: stat, skill: skill,
                            modifiers: modifiers)
      end

      context 'rolls 1-15' do
        it 'returns failure' do
          (1..15).each do |i|
            allow(D20).to receive(:roll).and_return(i)
            expect(check.send(:calculate_degree_of_success)).to eq(:fail)
          end
        end
      end

      context 'rolls 16-25' do
        it 'returns partial success' do
          (16..25).each do |i|
            allow(D20).to receive(:roll).and_return(i)
            expect(check.send(:calculate_degree_of_success)).to eq(:partial)
          end
        end
      end

      context 'rolls 26+' do
        it 'returns full success' do
          (26..40).each do |i|
            allow(D20).to receive(:roll).and_return(i)
            expect(check.send(:calculate_degree_of_success)).to eq(:full)
          end
        end
      end
    end

    context 'very hard dl' do
      let(:dl) { :very_hard }
      let(:check) do
        described_class.new(performer: character, difficulty_level: dl, stat: stat, skill: skill,
                            modifiers: modifiers)
      end

      context 'rolls 1-20' do
        it 'returns failure' do
          (1..20).each do |i|
            allow(D20).to receive(:roll).and_return(i)
            expect(check.send(:calculate_degree_of_success)).to eq(:fail)
          end
        end
      end

      context 'rolls 21-30' do
        it 'returns partial success' do
          (21..30).each do |i|
            allow(D20).to receive(:roll).and_return(i)
            expect(check.send(:calculate_degree_of_success)).to eq(:partial)
          end
        end
      end

      context 'rolls 31+' do
        it 'returns full success' do
          (31..40).each do |i|
            allow(D20).to receive(:roll).and_return(i)
            expect(check.send(:calculate_degree_of_success)).to eq(:full)
          end
        end
      end
    end

    context 'nigh impossible dl' do
      let(:dl) { :nigh_impossible }
      let(:check) do
        described_class.new(performer: character, difficulty_level: dl, stat: stat, skill: skill,
                            modifiers: modifiers)
      end

      context 'rolls 1-25' do
        it 'returns full success' do
          (1..25).each do |i|
            allow(D20).to receive(:roll).and_return(i)
            expect(check.send(:calculate_degree_of_success)).to eq(:fail)
          end
        end
      end

      context 'rolls 26-35' do
        it 'returns partial success' do
          (26..35).each do |i|
            allow(D20).to receive(:roll).and_return(i)
            expect(check.send(:calculate_degree_of_success)).to eq(:partial)
          end
        end
      end

      context 'rolls 36+' do
        it 'returns full success' do
          (36..40).each do |i|
            allow(D20).to receive(:roll).and_return(i)
            expect(check.send(:calculate_degree_of_success)).to eq(:full)
          end
        end
      end
    end
  end
end
