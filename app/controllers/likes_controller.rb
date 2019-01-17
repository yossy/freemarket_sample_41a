class LikesController < ApplicationController
  before_action :set_product,only: [:create,:destroy]
  
  def index
    @products = current_user.liked_products
  end

  def create
    @product.likes.new(user_id: current_user.id)
    respond_to do |format|
      if @like.save
        format.html {redirect_back(fallback_location: product_path(@product))}
        format.js
      else
        redirect_back(fallback_location: product_path(@product))
      end
    end
  end
  
  def destroy
    @like = @product.likes.where(user_id: current_user.id)

    respond_to do |format|
      if @like.destroy
        format.html {redirect_back(fallback_location: product_path(@product))}
        format.js
      else
        redirect_back(fallback_location: product_path(@product))
      end
    end
  end
  
  def set_product
    @product = Product.find(params[:product_id])
  end
end
