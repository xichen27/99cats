class CatsController < ApplicationController
  before_action :redirect_if_not_authorized, only: [:edit, :update]

  def index
    @cats = Cat.all
    render :index
  end
  
  def show
    @cat = Cat.find(params[:id])
    @requests = @cat.cat_rental_requests.order("start_date")
  end
  
  def new
    @cat = Cat.new
  end
  
  def create
    @cat = current_user.cats.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end
  
  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end
  
  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end
  
  def redirect_if_not_authorized
    if @cat.user_id != current_user.id
      redirect_to cats_url
    end
  end
  
  private
  def cat_params
    params[:cat].permit(:name, :color, :birth_day,
      :sex, :description)
  end
end
