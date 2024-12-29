class Admin::ShowtimesController < ApplicationController
  def new
    @showtime = Showtime.new
  end

  def index
    @showtime = Showtime.new
    @showtimes = Showtime.all
  end

  def create
    @showtime = Showtime.new(showtime_params)

    if @showtime.save
      redirect_to admin_showtimes_path, notice: "Showtimeが作成されました！"
    else
      Rails.logger.warn("保存に失敗しました: #{@showtime.errors.full_messages}")
      render :new
    end
  end

  private

  def showtime_params
    params.require(:showtime).permit(:movie_id, :screen_id, :screening_time)
  end
end
