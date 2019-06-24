# frozen_string_literal: true

require_relative 'lap_data'
require_relative 'driver_results'
require_relative 'race_statistics'

# Object to read the log file
class RaceLogReader
  attr_reader :results

  def initialize(log_file)
    @indexed_data = {}
    read_file(log_file)
    @results = @indexed_data.values
  end

  private

  def read_file(log_file)
    IO.foreach(log_file)
      .lazy
      .drop(1)
      .map(&:chomp)
      .reject(&:empty?)
      .each { |it| transform(it.split) }
  end

  def transform(array)
    driver_results = DriverResults.new(array[1], array[3])
    lap_data = LapData.new(time: array[0], lap: array[4],
                           lap_time: array[5], avg_speed: array[6])
    add_lap(driver_results, lap_data)
  end

  def add_lap(driver, lap_data)
    @indexed_data[driver.code] = driver unless @indexed_data.key?(driver.code)
    @indexed_data[driver.code].add_lap(lap_data)
  end
end
