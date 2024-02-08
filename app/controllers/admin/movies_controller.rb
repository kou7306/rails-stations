class Admin::MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
    def index
        @movies = Movie.all.includes(:schedules)
    end
    def new
        @movie = Movie.new
    end
      # フォームから送信されたデータを受け取り、新しい映画を作成するアクション
    def create
        # 映画の新しいインスタンスを作成
        @movie = Movie.new(movie_params)
        # データベースに同じ名前の映画が存在するかを確認
        if Movie.exists?(name: @movie.name)
            # 同じ名前の映画が存在する場合はエラーメッセージを設定し、新規登録フォームを再表示
            flash.now[:alert] = "同じタイトルの映画がすでに存在します。"
            render :new, status: :bad_request
        else
            # 同じ名前の映画が存在しない場合は、通常通り保存を試みる
            if @movie.save
            redirect_to admin_movies_path, notice: '映画が登録されました。'
            else
            # 保存に失敗した場合は新規登録フォームを再表示
            render :new, status: :bad_request
            end
        end
        end
         # GET /admin/movies/:id/edit
  def edit
  end

  # PUT /movies/:id
  def update
    if @movie.update(movie_params)
      redirect_to admin_movies_path, notice: '映画が更新されました。'
    else
      render :edit
    end
  end
  # DELETE /admin/movies/:id
  def destroy
    if @movie.destroy
      redirect_to admin_movies_path, notice: '映画が削除されました。'
    else
      redirect_to admin_movies_path, alert: '映画の削除に失敗しました。'
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules.order(:start_time)
  end


  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Strong Parametersを使用してフォームから受け取るパラメーターを指定
    def movie_params
        params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
    end

end
