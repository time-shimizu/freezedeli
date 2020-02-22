require 'rails_helper'

RSpec.feature "index", type: :feature do
  let!(:product) { create(:product) }

  before do
    visit freezedeli_index_path
  end

  scenario 'タイトルが表示される' do
    expect(page).to have_title "Freeze Deli"
  end

  scenario 'おすすめ商品をクリックした時正しく詳細ページに飛ぶ' do
    click_link product.name
    expect(current_path).to eq freezedeli_product_path(product.id)
    expect(page).to have_content product.name
    expect(page).to have_content product.display_price
    expect(page).to have_content product.description
  end
end
