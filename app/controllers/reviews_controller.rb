class ReviewsController < ApplicationController

  before_filter :authenticate, :only => [ :create ]

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to [@product]
    else
      redirect_to [@product]
    end
  end

  def destroy
     @product = Product.find(params[:product_id])
     @product.reviews.find(params[:id]).destroy
     redirect_to [@product]
  end

private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

  def authenticate
    current_user.present?
  end

end
