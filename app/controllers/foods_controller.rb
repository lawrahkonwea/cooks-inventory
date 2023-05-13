class FoodsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  # before_action :set_food, only: %i[show edit update destroy]
  def new
    # @user = current_user
    @food = Food.new
  end

  def index
    @foods = Food.all
  end

  def show; end

  def create
    # @user = current_user
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:success] = 'Food was successfully deleted.'
    redirect_to foods_path
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
