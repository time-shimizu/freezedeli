require 'rails_helper'

RSpec.describe "FreezeDeli", type: :request do
  before do
    get freezedeli_index_path
  end

  it "レスポンスが正しい" do
    expect(response).to be_successful
  end
end
