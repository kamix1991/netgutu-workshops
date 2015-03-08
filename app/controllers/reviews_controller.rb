class ReviewsController < ApplicationController
  load_and_authorize_resource
  
  expose_decorated(:review)
  expose_decorated(:reviews)
  expose_decorated(:product)
  expose_decorated(:category)

  def edit
  end

  def create
    self.review = Review.new(review_params)
    review.user = current_user
    if review.save
      product.reviews << review
      redirect_to category_product_path(product.category, product), notice: 'Review was successfully created.'
    else
      render 'products/show'
    end
  end

  def destroy
    review.destroy
    redirect_to category_product_path(product.category, product), notice: 'Review was successfully destroyed.'
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
