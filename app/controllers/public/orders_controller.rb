class Public::OrdersController < ApplicationController
    before_action :set_end_user
    before_action :authenticate_end_user!
    def new
        @order = Order.new
        @addresses = @end_user.addresses
    end

    def confirm
        @order = Order.new
        @cart_items = current_end_user.cart_items
        @order.payment_method = params[:order][:payment_method].to_i

        @add = params[:order][:add].to_i

        case @add
        when 0
            @order.postal_code = @end_user.postal_code
            @order.address = @end_user.address
            @order.name = @end_user.name
        when 1
            @address = params[:order][:address]
            @send_address = Address.find_by(address: @address)
            @order.postal_code = @send_address.postal_code
            @order.address = @send_address.address
            @order.name = @send_address.name
        when 3
            @order.postal_code = paramas[:order][:new_add][:postal_code]
            @order.address = params[:order][:new_add][:address]
            @order.name = params[:order][:new_add][:name]             
        end

    end

    def complete
    end

    def create
        if current_end_user.cart_items.exists?
            @order = Order.new(order_params)

            add = params[:order][:add].to_i

            if Address.find_by(address: @order.address).nil?
                @address = Address.new
                @address.postal_code = @order.postal_code
                @address.address = @order.address
                @address.name = @order.name
                @address.end_user_id = current_end_user.id
                @address.save
            end
            #@order.saved
            @end_user.cart_items.each do |cart_item|
                order_detail = @order.order_details.build
                #order_detail = OrderDetail.new
                #order_detail.order_id = @order.id.to_i
                order_detail.item_id = cart_item.item_id.to_i
                order_detail.amount = cart_item.amount.to_i
                order_detail.price = cart_item.item.price.to_i
                order_detail.save
                cart_item.destroy
            end
            @order.save
            redirect_to complete_path
        else
            redirect_to cart_items_path
            flash[:danger] = 'カートが空です'
        end
    end

    def index
        @orders = current_end_user.orders
    end

    def show
        @order = Order.find(params[:id])
    end

    private
        def set_end_user
            @end_user = current_end_user
        end

        def order_params
            params.require(:order).permit(:postal_code,:address,:name,:shipping_cost,:totalpayment,:payment_method,:status,:end_user_id,:status).merge(end_user_id: current_end_user.id)
        end
end
