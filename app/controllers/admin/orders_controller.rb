class Admin::OrdersController < ApplicationController
    before_action :authenticate_admin!

    def index
        @orders = Order.all
    end

    def show 
        @order = Order.find(params[:id])
    end

    def update
        order = Order.find(params[:id])
        order.update(order_params)
        binding.pry
        
        redirect_to admin_order_path(order)
    end

    private 
        def order_params
            params.require(:order).permit(:status).merge(status: params[:order][:status.to_i])
        end
end
