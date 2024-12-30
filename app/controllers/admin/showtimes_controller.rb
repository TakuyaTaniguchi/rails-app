class Admin::ShowtimesController < ApplicationController
  def new
    @showtime = Showtime.new
  end

  def index
    @showtime = Showtime.new
    @showtimes = Showtime.all
    head :no_content
  end

  def create
    @showtime = Showtime.new(showtime_params)

    if @showtime.save
      redirect_to admin_root_path, notice: "スケジュールが作成されました！"
    else
      flash[:alert] = "スケジュールの作成に失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @showtime = Showtime.find(params[:id])
    @showtime.destroy
    redirect_to admin_root_path, notice: "スケジュールが削除されました！"
  end

  private

  def showtime_params
    params.require(:showtime).permit(:movie_id, :screen_id, :screening_time)
  end
end
