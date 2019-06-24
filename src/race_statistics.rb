# frozen_string_literal: true

# This object holds statistics from the race
class RaceStatistics
  attr_reader :data
  
  def initialize(race_data)
    @data = race_data.sort do |a, b|
      a.last_lap.time <=> b.last_lap.time
    end
  end

  def best_lap_driver_results
    @data.min do |r1, r2|
      r1.best_lap_time <=> r2.best_lap_time
    end
  end

  def winner
    @data.first
  end

  def ranking
    @data.map.with_index(1) do |it, position|
      "#{position}. #{it}. #{it.compared_to(winner)}"
    end
  end
end
