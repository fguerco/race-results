# frozen_string_literal: true

require_relative '../src/race_log_reader'
require_relative '../src/race_statistics'

describe RaceStatistics do
  log_reader = RaceLogReader.new("#{__dir__}/../log.txt")
  statistics = described_class.new(log_reader.results)

  context 'Overall data' do
    context 'Best lap' do
      subject { statistics.best_lap_driver_results }

      context 'lap time' do
        it { expect(subject.best_lap_time.to_s).to eq '01:02.769' }
      end

      context 'driver name' do
        it { expect(subject.name).to eq 'F.MASSA' }
      end

      context 'lap number' do
        it { expect(subject.best_lap_number).to eq 3 }
      end
    end
  end

  context 'Ranking' do
    context '1st place' do
      subject { statistics.ranking[0].to_s }

      it { is_expected.to eq '1. Driver: 038 - F.MASSA, Laps completed: 4, Total time: 04:11.575, Best lap time: 01:02.769, Avg speed: 44.246. Winner \o/' }
    end

    context '2nd place' do
      subject { statistics.ranking[1].to_s }

      it { is_expected.to eq '2. Driver: 002 - K.RAIKKONEN, Laps completed: 4, Total time: 04:15.152, Best lap time: 01:03.076, Avg speed: 43.627. Finished 3.577 seconds after the winner' }
    end

    context '3rd place' do
      subject { statistics.ranking[2].to_s }

      it { is_expected.to eq '3. Driver: 033 - R.BARRICHELLO, Laps completed: 4, Total time: 04:16.079, Best lap time: 01:03.716, Avg speed: 43.468. Finished 4.504 seconds after the winner' }
    end

    context '4th place' do
      subject { statistics.ranking[3].to_s }

      it { is_expected.to eq '4. Driver: 023 - M.WEBBER, Laps completed: 4, Total time: 04:17.721, Best lap time: 01:04.216, Avg speed: 43.191. Finished 6.146 seconds after the winner' }
    end

    context '5th place' do
      subject { statistics.ranking[4].to_s }

      it { is_expected.to eq '5. Driver: 015 - F.ALONSO, Laps completed: 4, Total time: 04:54.218, Best lap time: 01:07.011, Avg speed: 38.066. Finished 42.643 seconds after the winner' }
    end

    context '6th place' do
      subject { statistics.ranking[5].to_s }

      it { is_expected.to eq '6. Driver: 011 - S.VETTEL, Laps completed: 3, Total time: 06:27.274, Best lap time: 01:18.097, Avg speed: 25.746. Didn\'t finish :(' }
    end
  end
end
