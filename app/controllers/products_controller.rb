class ProductsController < ApplicationController
  load_and_authorize_resource

  expose(:category)
  expose(:products)
  expose(:product)
  expose_decorated(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
    @products = category.products
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    authenticate_user!
    self.product = Product.new(product_params)
    product.user_id = current_user.id
    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if self.product.update(product_params)
      redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end
end
