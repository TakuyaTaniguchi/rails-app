class Admin::DashboardController < ApplicationController
  layout 'admin'
  def index
    @showtime = Showtime.new
    @showtimes = Showtime.includes(:movie).order(:screening_time)
    @grouped_showtimes = @showtimes.group_by { |showtime| showtime.screening_time.to_date }

  end
end
