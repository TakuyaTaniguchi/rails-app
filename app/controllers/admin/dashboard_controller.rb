class Admin::DashboardController < ApplicationController
  layout 'admin'
  def index
    @showtime = Showtime.new
    @showtimes = Showtime.includes(:movie).order(:screening_time)
    @grouped_showtimes = Showtime.includes(:movie).order(:screen_id, :screening_time).group_by(&:screen_id)
    @movies = Movie.all
    @screens = Screen.all
  end
end
