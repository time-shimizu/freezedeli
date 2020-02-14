class Freezedeli::StaticPagesController < ApplicationController
  def index
    @products = Spree::Product.all
  end
end
