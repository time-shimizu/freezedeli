class Freezedeli::ProductsController < ApplicationController
  def show
    @product = Spree::Product.find(params[:id])
  end
end
