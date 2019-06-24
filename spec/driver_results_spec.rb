# frozen_string_literal: true

require_relative '../src/driver_results'
require_relative '../src/lap_data'

describe DriverResults do
  context 'With a driver without any lap data' do
    subject { described_class.new('1', 'Driver') }

    context '#laps_completed' do
      it { expect(subject.laps_completed).to be_nil }
    end

    context '#total_time' do
      it { expect(subject.total_time).to be_nil }
    end

    context '#best_lap_time' do
      it { expect(subject.best_lap_time).to be_nil }
    end

    context '#best_lap_number' do
      it { expect(subject.best_lap_number).to be_nil }
    end

    context '#avg_speed' do
      it { expect(subject.avg_speed).to be_nil }
    end
  end

  context 'With a driver with two laps completed' do
    subject do
      driver_results = described_class.new('1', 'Driver')
      driver_results.add_lap(
        LapData.new(time: '23:49:08.277', lap: '1',
                    lap_time: '1:02.852', avg_speed: '44,275')
      )
      driver_results.add_lap(
        LapData.new(time: '23:50:11.447', lap: '2',
                    lap_time: '1:03.170', avg_speed: '35,47')
      )
      driver_results
    end

    context '#laps_completed' do
      it { expect(subject.laps_completed).to eq 2 }
    end

    context '#total_time' do
      it { expect(subject.total_time.to_s).to eq '02:06.021' }
    end

    context '#best_lap_time' do
      it { expect(subject.best_lap_time.to_s).to eq '01:02.852' }
    end

    context '#best_lap_number' do
      it { expect(subject.best_lap_number).to eq 1 }
    end

    context '#avg_speed' do
      it { expect(subject.avg_speed).to eq 39.873 }
    end
  end
end
