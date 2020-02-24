class Freezedeli::LineItemsController < ApplicationController
  protect_from_forgery
  include Spree::Core::ControllerHelpers::Order
  include Spree::Core::ControllerHelpers::Auth
  include Spree::Core::ControllerHelpers::Store

  def create
    order = current_order(create_order_if_necessary: true)
    authorize! :update, order, cookies.signed[:guest_token]

    variant = Spree::Variant.find(params[:variant_id])
    quantity = params[:quantity].to_i

    if !quantity.between?(1, 2_147_483_647)
      order.errors.add(:base, t('spree.please_enter_reasonable_quantity'))
    end

    begin
      @line_item = order.contents.add(variant, quantity)
    rescue ActiveRecord::RecordInvalid => e
      order.errors.add(:base, e.record.errors.full_messages.join(","))
    end

    if order.errors.any?
      flash[:error] = order.errors.full_messages.join(",")
      redirect_back_or_default(spree.root_path)
      return
    else
      redirect_to freezedeli_cart_path
    end
  end

  def destroy
    item = Spree::LineItem.find(params[:id])
    item.order.contents.remove_line_item(item)
    redirect_to freezedeli_cart_path
  end
end
