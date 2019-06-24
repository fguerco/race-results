# frozen_string_literal: true

require 'time'
require_relative 'time_span'

# Data of each lap completed
class LapData
  attr_reader :time, :lap, :lap_time, :avg_speed

  def initialize(params)
    @time = Time.parse("#{params[:time]} UTC")
    @lap = params[:lap].to_i
    @lap_time = TimeSpan.new(params[:lap_time])
    @avg_speed = params[:avg_speed].sub(/[,]/, '.').to_f
  end
end
