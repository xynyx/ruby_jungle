class ReviewsController < ApplicationController
  before_filter :current_user
  
  def create

    description = params[:review][:description]
    rating = params[:rating].to_i
    product_id = params[:product_id].to_i
    @review = Review.new(
      product_id: product_id,
      user_id: current_user.id,
      description: description,
      rating: rating)

    if @review.save
      redirect_to '/'
    else
      redirect_to `products/#{product_id}`
    end

  end
end


