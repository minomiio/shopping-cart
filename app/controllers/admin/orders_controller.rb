class Admin::OrdersController < Admin::AdminController
  def index
    @orders = Order.all
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_orders_path, notice: "Order updated"
    else
      flash.now[:alert] = @order.errors.full_messages.to_sentence
      render "admin/orders/edit"
    end
  end

  private

  def order_params
    params.require(:order).permit(:payment_status, :shipping_status)
  end
end
