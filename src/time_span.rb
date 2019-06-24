# frozen_string_literal: true

require 'time'

# Object to operate the lap times
class TimeSpan
  include Comparable

  attr_reader :minute, :second, :millis

  def initialize(time_str)
    @time = Time.parse("0:#{time_str} UTC")
    @minute = @time.min
    @second = @time.sec
    @millis = @time.usec / 1_000
  end

  def +(other)
    new_time = @time + to_seconds(other)
    TimeSpan.new format_time(new_time)
  end

  def -(other)
    (to_seconds(self) - to_seconds(other)).round(3)
  end

  def <=>(other)
    to_seconds(self) <=> to_seconds(other)
  end

  def to_s
    format_time(@time)
  end

  private

  def format_time(time)
    time.strftime '%M:%S.%3N'
  end

  def to_seconds(time_span)
    time_span.minute * 60 + time_span.second + time_span.millis / 1_000.0
  end
end
