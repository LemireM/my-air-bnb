class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
    @reviews = @property.reviews
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id
    if @property.save
      redirect_to @property
    else
      render :new
    end
  end

  private

  def property_params
    params.require(:property).permit(:title, :description, :address, :city, :country, :price_per_night, :capacity)
  end
end
