# frozen_string_literal: true

# Object to represent each driver with their lap data
class DriverResults
  attr_reader :code, :name

  def initialize(code, name)
    @code = code
    @name = name
    @laps = []
  end

  def add_lap(lap_data)
    @laps << lap_data
  end

  def laps_completed
    return nil if @laps.empty?

    @laps.max do |lap1, lap2|
      lap1.lap <=> lap2.lap
    end.lap
  end

  def total_time
    return nil if @laps.empty?

    @laps.map.reduce(TimeSpan.new('0:0')) do |acc, lap|
      acc + lap.lap_time
    end
  end

  def best_lap_number
    return nil if @laps.empty?

    best_lap.lap
  end

  def best_lap_time
    return nil if @laps.empty?

    best_lap.lap_time
  end

  def avg_speed
    return nil if @laps.empty?

    (@laps.map.reduce(0) do |acc, lap|
      acc + lap.avg_speed
    end / @laps.size.to_f).round(3)
  end

  def last_lap
    @laps.last
  end

  def compared_to(winner)
    if self == winner
      'Winner \o/'
    elsif laps_completed == winner.laps_completed
      "Finished #{total_time - winner.total_time} seconds after the winner"
    else
      'Didn\'t finish :('
    end
  end

  def to_s
    "Driver: #{@code} - #{@name}, "\
    "Laps completed: #{laps_completed}, Total time: #{total_time}, "\
    "Best lap time: #{best_lap_time}, Avg speed: #{avg_speed}"
  end

  private

  def best_lap
    @laps.min do |lap1, lap2|
      lap1.lap_time <=> lap2.lap_time
    end
  end
end
