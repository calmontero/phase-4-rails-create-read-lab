class PlantsController < ApplicationController
  # GET /plants
  def index
    plants = Plant.all
    render json: plants, only: [:id, :name, :image, :price]
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    if Plant
      render json: plant, only: [:id, :name, :image, :price]
    else
      render json: { error: "Plant not found" }, status: :not_found
    end
  end

  private
  # all methods below here are private

  def plant_params
    params.permit(:name, :image, :price)
  end
end