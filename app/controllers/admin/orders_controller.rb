class Admin::OrdersController < ApplicationController
    before_action :authenticate_admin!

    def index
        @orders = Order.all.page(params[:page]).per(10)
    end

    def show 
        @order = Order.find(params[:id])
    end

    def update
        order = Order.find(params[:id])
        order.update(order_params)
        
        @status = params[:order][:status]
        #binding.pry
        if @status == "入金確認"
            order.order_details.each do |detail|
                detail.making_status = "制作待ち"
                detail.save
            end
        end

        
        redirect_to admin_order_path(order)
    end

    private 
        def order_params
            params.require(:order).permit(:status)
        end
end
