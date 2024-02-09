class Admin::SchedulesController < ApplicationController
    before_action :set_schedule, only: [:edit,:show, :update, :destroy]
    before_action :set_movie, only: [:new, :create]
    def index
        
        @schedules = Schedule.includes(:movie).where.not(movie_id: nil).order(:movie_id, :start_time)
    end

  # GET /admin/movies/:movie_id/schedules/new
  def new
    @schedule = @movie.schedules.new
  end

  def create
    schedule_params_with_datetime = schedule_params.merge(start_time: "#{params[:schedule][:start_date]} #{params[:schedule][:start_time]}", end_time: "#{params[:schedule][:end_date]} #{params[:schedule][:end_time]}")
    @schedule = @movie.schedules.new(schedule_params_with_datetime)
    if @schedule.save
      redirect_to admin_schedules_path, notice: 'スケジュールが作成されました'
    else
      render :new
    end
  end
  

  # PUT /admin/schedules/:id
  def update
    if @schedule.update(schedule_params)
      redirect_to admin_schedule_path(@schedule), notice: 'スケジュールが更新されました'
    else
      render :show
    end
  end

  # DELETE /admin/schedules/:id
  def destroy
    @schedule.destroy
    redirect_to admin_schedules_path, notice: 'スケジュールが削除されました'
  end

    

 
  
    # GET /admin/schedules/:id
    def edit
    end

    def show
    end
  
    private
 # 対象の映画を設定する
    def set_movie
        @movie = Movie.find(params[:movie_id])
    end
    # 対象のスケジュールを設定する
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

# スケジュールのパラメーターを取得する
def schedule_params
    params.require(:schedule).permit(:start_time, :end_time)
end

end