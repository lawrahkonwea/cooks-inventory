class FoodsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_food, only: %i[show edit update destroy]
  def new
    @food = Food.new
  end

  def index
    @foods = current_user.foods
  end

  def show
    # ...
  end

  def create
    @food = current_user.foods.new(food_params)
    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  def destroy
    @food = current_user.foods.find(params[:id])

    if @food.destroy
      flash[:success] = 'Food was successfully deleted.'
    else
      flash[:error] = 'Failed to delete food.'
    end
    redirect_to foods_path
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :user)
  end
end
