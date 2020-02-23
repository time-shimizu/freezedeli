require 'rails_helper'

RSpec.feature "category", type: :feature do
  let!(:taxonomy) { create(:taxonomy) }
  let!(:taxon1)   { create(:taxon, name: "ガッツリ") }
  let!(:taxon2)   { create(:taxon, name: "ヘルシー") }
  let!(:product)  { create(:product, name: "ハンバーグ弁当", taxons: [taxon1]) }

  before do
    visit freezedeli_category_path(taxon1.id)
  end

  scenario "サイドバーが表示される" do
    within ".side-nav" do
      expect(page).to have_content taxonomy.name
      expect(page).to have_content taxon1.name
    end
  end

  scenario "商品名をクリックしたら商品詳細ページに飛ぶ" do
    click_link product.name
    expect(current_path).to eq freezedeli_product_path(product.id)
    expect(page).to have_content product.images.first
    expect(page).to have_content product.name
    expect(page).to have_content product.display_price
  end

  context "紐づくtaxonに飛んだ時" do
    scenario "商品が表示される" do
      click_link taxon1.name
      expect(current_path).to eq freezedeli_category_path(taxon1.id)
      expect(page).to have_content product.name
    end
  end

  context "紐づかないtaxonに飛んだ時" do
    scenario "商品が表示されない" do
      click_link taxon2.name
      expect(current_path).to eq freezedeli_category_path(taxon2.id)
      expect(page).not_to have_content product.name
    end
  end
end
