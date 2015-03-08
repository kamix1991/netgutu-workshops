class UsersController < ApplicationController
	load_and_authorize_resource
  
  expose_decorated(:users)
  expose_decorated(:user)
  expose_decorated(:reviews, ancestor: :user)

  def index
  end

  def show
  end

  def products
  end

  def reviews_list
  end

end
