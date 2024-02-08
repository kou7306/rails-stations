class MoviesController < ApplicationController
    def index
      # クエリパラメータから検索条件を取得
      is_showing_param = params[:is_showing]
      keyword_param = params[:keyword]
  
      # 全ての映画を取得するクエリ
      @movies = Movie.all
  
      # is_showingパラメータによる絞り込み
      if is_showing_param.present?
        is_showing = is_showing_param.to_i
        @movies = @movies.where(is_showing: is_showing)
      end
  
      # keywordパラメータによる絞り込み
      if keyword_param.present?
        keyword = "%#{keyword_param}%"
        @movies = @movies.where('name LIKE ? OR description LIKE ?', keyword, keyword)
      end
  
      # 絞り込まれた映画のリストを表示
      render 'index'
    end

    def show
        id = params[:id]
        @movie = Movie.find_by_id(id)
        if @movie.nil?
          # IDに対応する映画が存在しない場合の処理
          flash[:alert] = "この映画は存在しません。"
          redirect_to movies_path
        else
          if @movie.is_showing
            # 上映中の場合は詳細を表示
            @schedules = @movie.schedules
            render 'show'
          else
            # 上映中でない場合はエラーメッセージを表示
            flash[:alert] = "この映画は現在上映されていません。"
            redirect_to movies_path
          end
        end
        
    end

      
  end
  