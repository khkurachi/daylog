class DaysController < ApplicationController
  def index
    @days = Day.all.page(params[:page]).per(7)
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
    @day = Day.find(params[:id])
  end

  def search
    if params[:impression].present?
      @days = Day.where('impression LIKE ?', "%#{params[:impression]}%")
    else
      @days = Day.none
    end
  end

  private

  def day_params
    params.require(:day)
    .permit(:today_point, :happy, :sad, :effort, :could_not, :learn, :impression, :want_do, :must_do, :do_not, :idea, :user_id)
    .merge(user_id: current_user.id)
  end
end
