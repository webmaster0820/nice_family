class OrderItemsController < ApplicationController

  def index
    @items = current_cart.order.items
  end

  def create
    current_cart.add_item(
      course_id: params[:course_id],
      quantity: params[:quantity]
    )

    redirect_to kurv_path
  end

  def destroy
    current_cart.remove_item(id: params[:id])
    redirect_to kurv_path
	end

  private

end