class ReservationsController < ApplicationController
  protect_from_forgery

  def new
    @movie = Movie.find(params[:movie_id])
    @schedule = Schedule.find(params[:schedule_id])
    @sheet = Sheet.find(params[:sheet_id]) if params[:sheet_id].present?
    @reservation = Reservation.new
    @date = params[:date]
    render_400 unless @sheet && @date
  end
  def create
    @reservation = Reservation.new(reservation_params)
    if Reservation.exists?(sheet_id: reservation_params[:sheet_id], schedule_id: reservation_params[:schedule_id], date: reservation_params[:date])
      redirect_to movie_reservation_path(params[:reservation][:movie_id], schedule_id: params[:reservation][:schedule_id], date: params[:reservation][:date]), alert: 'その座席はすでに予約済みです', status: 302
      return
    end

    if @reservation.save
      redirect_to movie_path(params[:reservation][:movie_id] || default_movie_id), notice: '予約が完了しました'
    else
      redirect_to movie_reservation_path(params[:reservation][:movie_id] || default_movie_id, schedule_id: params[:reservation][:schedule_id], date: params[:reservation][:date]), alert: '予約に失敗しました'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:schedule_id, :sheet_id, :name, :email, :date)
  end

  def render_400
    render plain: 'Bad Request', status: :bad_request
  end

  def default_movie_id
    # 例えば、最新の映画の ID をデフォルトとして返す場合
    Movie.last.id
  end
end
     