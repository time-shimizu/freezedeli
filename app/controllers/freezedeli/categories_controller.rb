class Freezedeli::CategoriesController < ApplicationController
  def show
    @taxon = Spree::Taxon.find(params[:id])
    @taxonomies = Spree::Taxonomy.includes(:taxons)
    @products = Spree::Product.in_taxon(@taxon).includes(master: [:images, :default_price])
  end
end
