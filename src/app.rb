# frozen_string_literal: true

require_relative 'race_log_reader'
require_relative 'race_statistics'

results = RaceLogReader.new("#{__dir__}/../log.txt").results
statistics = RaceStatistics.new(results)

puts '', 'Ranking'
statistics.ranking.each do |it|
  puts it
end

puts '', 'Best lap overall:'
best_lap_data = statistics.best_lap_driver_results
puts "#{best_lap_data.best_lap_time} by #{best_lap_data.name} on lap #{best_lap_data.best_lap_number}"
