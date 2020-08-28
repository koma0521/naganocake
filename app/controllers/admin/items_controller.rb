class Admin::ItemsController < ApplicationController
    before_action :authenticate_admin! 
    def index 
        if params[:search].nil?
            @items = Item.all.page(params[:page]).per(10)
        else
            @items = Item.where('name LIKE ?', "%#{search}%")
        end        
    end

    def new
        @item = Item.new
    end

    def create
        item = Item.new(item_params)
        if item.save
            redirect_to admin_item_path(item)
        else
            @item = item
            render 'new'
        end
    end

    def show
        @item = Item.find(params[:id])
        @price = @item.price * 1.10
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        item = Item.find(params[:id])
        if item.update(item_params)
            redirect_to admin_item_path(item)
        else
            @item = item
            render 'edit'
        end
    end

    def top
        search_date = Date.today
        @order = Order.where(created_at: search_date.in_time_zone.all_day)
    end

    private
        def item_params
            params.require(:item).permit(:genre_id,:name,:image,:introduction,:price,:sale_status)
        end
end
