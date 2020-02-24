class Freezedeli::OrdersController < ApplicationController
  include Spree::Core::ControllerHelpers::Order
  include Spree::Core::ControllerHelpers::Auth
  include Spree::Core::ControllerHelpers::Store

  def edit
    @order = current_order || Spree::Order.incomplete.
      find_or_initialize_by(guest_token: cookies.signed[:guest_token])
  end

  def update
    @order = Spree::Order.find_by(number: params[:number])
    @order.contents.update_cart(order_params)
    redirect_to potepan_cart_path
  end

  def order_params
    params.require(:order).permit(line_items_attributes: [:id, :quantity])
  end
end
