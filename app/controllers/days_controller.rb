class DaysController < ApplicationController
  before_action :set_time
  before_action :set_find, only: [:show, :edit, :update]
  before_action :set_search, only: :search
  def index
    if user_signed_in?
      @user = current_user.days.all.page(params[:page]).per(7).order(created_at: :desc)
    end
  end

  def new
    @day = Day.new
  end

  def create
    @day = Day.new(day_params)
    if @day.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @day.comments.includes(:user)
    @today_comments = Comment.all.includes(:user)
  end

  def edit
  end

  def update
    if @day.update(day_params)
      redirect_to day_path(@day.id)
    else
      render :edit
    end
  end

  def search
    
  end

  private

  def set_time
    @time = Time.now
  end
  
  def set_find
    @day = Day.find(params[:id])
  end

  def set_search
    if params[:impression].present?
      @days = current_user.days.where('impression LIKE ?', "%#{params[:impression]}%")
    elsif params[:created_at].present?
      @days = current_user.days.where('created_at LIKE ?', "%#{params[:created_at]}%")
    else
      @days = current_user.days.order(created_at: :desc)
    end
  end

  def day_params
    params.require(:day)
    .permit(:today_point, :happy, :sad, :effort, :could_not, :learn, :impression, :want_do, :must_do, :do_not, :idea, :user_id)
    .merge(user_id: current_user.id)
  end

end
