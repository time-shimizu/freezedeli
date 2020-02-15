class Freezedeli::StaticPagesController < ApplicationController
  def index
    @products = Spree::Product.all[-4..-1]
  end
end
