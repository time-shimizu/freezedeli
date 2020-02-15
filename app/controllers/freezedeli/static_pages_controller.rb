class Freezedeli::StaticPagesController < ApplicationController
  def index
    taxons = "弁当"
    @products = Spree::Product.in_taxons(taxons).all.includes(master: [:images, :default_price]).sample(4)
  end
end
