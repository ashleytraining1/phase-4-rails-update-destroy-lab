class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  #PATCH /plants
  def update
    render json: Plant.update(params[:id], plant_params)
  end

  #DELETE
  def destroy
    plant = Plant.find_by(id: params[:id])
    if(plant)
      plant.destroy
      head :no_content
    else
      render json: {error: "plant not found!"}, status: :no_content
    end
  end
  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
end
