# frozen_string_literal: true

require_relative '../src/time_span'

describe TimeSpan do
  context 'Creating an instance with a time of 3:20.45' do
    subject { described_class.new('3:20.45') }

    it 'should have minute = 3' do
      expect(subject.minute).to eql 3
    end

    it 'should have second = 20' do
      expect(subject.second).to eql 20
    end

    it 'should have millis = 450' do
      expect(subject.millis).to eql 450
    end
  end

  context 'Comparison' do
    context 'Comparing an instance with a time of 2:10' do
      subject { described_class.new('2:10') }

      context 'With an instance with a time of 2:9' do
        let(:another) { described_class.new('2:9') }

        it { is_expected.to be > another }
      end

      context 'With an instance with a time of 2:10.000' do
        let(:another) { described_class.new('2:10.000') }

        it 'should be equal' do
          is_expected.to eq another
        end
      end

      context 'With an instance with a time of 2:10.001' do
        let(:another) { described_class.new('2:10.001') }

        it { is_expected.to be < another }
      end
    end
  end

  context 'Addition' do
    subject { (base + another).to_s }

    context 'With a time of 1:10' do
      let(:base) { described_class.new('1:10') }

      context 'Adding 2:20' do
        let(:another) { described_class.new('2:20') }

        it { is_expected.to eq '03:30.000' }
      end

      context 'Adding 0:55' do
        let(:another) { described_class.new('0:55') }

        it { is_expected.to eq '02:05.000' }
      end
    end

    context 'With a time of 2:45.678' do
      let(:base) { described_class.new('2:45.678') }

      context 'Adding 0:0.322' do
        let(:another) { described_class.new('0:0.322') }

        it { is_expected.to eq '02:46.000' }
      end
    end
  end
end
