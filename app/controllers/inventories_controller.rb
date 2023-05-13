class InventoriesController < ApplicationController
  helper_method :new_inventory_path

  before_action :authenticate_user!

  before_action :set_inventory, only: %i[show edit update destroy]

  def index
    @inventories = Inventory.all
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(post_data)
    @inventory.user_id = current_user.id

    if @inventory.save
      flash[:notice] = 'inventory created successfully'
      redirect_to inventories_path
    else
      render :new
      flash[:notice] = 'Error when adding inventory'
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    flash[:success] = 'inventory deleted!'
    redirect_to inventories_path
  end

  def show
    @inventory = Inventory.find_by(id: params[:id])
  end

  private

  def set_inventory
    @inventory = if params[:id] == 'new'
                   Inventory.new
                 else
                   Inventory.find(params[:id])
                 end
  end

  def post_data
    params.require(:inventory).permit(:name)
  end
end
