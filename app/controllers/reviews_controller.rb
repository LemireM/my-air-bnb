class ReviewsController < ApplicationController
  def new
    @property = Property.find(params[:property_id])
    @review = @properties.reviews.new
  end
  
  def create
    @property = Property.find(params[:property_id])
    @review = @property.reviews.new(review_params)
    @review.user_id = user_id
    if @review.save
      redirect_to @property
    else
      render 'properties/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
