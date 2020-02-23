require 'rails_helper'

RSpec.feature "product", type: :feature do
  let!(:taxon)   { create(:taxon, name: "弁当") }
  let!(:product) { create(:product, taxons: [taxon]) }
  let!(:other_product) { create(:product, taxons: [taxon]) }

  before do
    visit freezedeli_product_path(product.id)
  end

  scenario "商品が正しく表示される" do
    expect(page).to have_content product.images.first
    expect(page).to have_content product.name
    expect(page).to have_content product.display_price
  end

  scenario "商品一覧に正しく戻れる" do
    click_link "商品一覧に戻る"
    expect(current_path).to eq freezedeli_category_path(taxon.id)
    expect(page).to have_content product.name
    expect(page).to have_content other_product.name
  end
end
