# frozen_string_literal: true

require_relative '../src/lap_data'

describe LapData do
  subject do
    described_class.new(time: '23:50:17.472',
                        lap: '3',
                        lap_time: '1:02.769',
                        avg_speed: '43,675')
  end

  context '#new' do
    it 'should have time = 23:50:17.472' do
      expect(subject.time).to eq Time.parse('23:50:17.472 UTC')
    end

    it 'should have lap = 3' do
      expect(subject.lap).to eq 3
    end

    it 'should have lap_time = TimeSpan(01:02.769)' do
      expect(subject.lap_time).to eq TimeSpan.new('01:02.769')
    end

    it 'should have avg_speed = 43.675' do
      expect(subject.avg_speed).to eq 43.675
    end
  end
end
