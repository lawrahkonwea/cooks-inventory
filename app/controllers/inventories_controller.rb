class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.created_by_current_user(current_user)
  end

  def show  
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.user = current_user

    if @inventory.save
      redirect_to inventories_path, notice: 'Inventory was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    redirect_to inventories_path, notice: 'Inventory was successfully Deleted.'
  end
end
