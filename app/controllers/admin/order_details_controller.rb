class Admin::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!
    def update
        detail = OrderDetail.find(params[:id])
        detail.update(order_detail_params)

        making_status = params[:order_detail][:making_status]
        if making_status == "制作中"
            order = detail.order
            order.status = "制作中"
            order.save
        end
        order = Order.find(detail.order_id.to_i)
        if order.order_details.all?{|detail| detail.making_status == "制作完了"}
            order.status = "発送準備中"
            order.save
        end
        

        redirect_to admin_order_path(detail.order_id.to_i)
        
        
    end
    private
        def order_detail_params
            params.require(:order_detail).permit(:making_status)
        end
end
