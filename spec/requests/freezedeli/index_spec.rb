require 'rails_helper'

RSpec.describe "FreezeDeli", type: :request do
  let!(:product) { create(:product, name: "bentou") }

  before do
    get freezedeli_index_path
  end

  it "レスポンスが正しい" do
    expect(response).to be_successful
  end

  it "商品が正しく表示される" do
    expect(response.body).to include product.name
  end
end
