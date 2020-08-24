class Admin::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!
    def update
        detail = OrderDetail.find(params[:id])
        detail.update(order_detail_params)
        redirect_to admin_order_path(detail)
    end
    private
        def order_detail_params
            params.require(:order_detail).permit(:making_status)
        end
end
