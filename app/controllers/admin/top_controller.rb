class Admin::TopController < ApplicationController
  def top
    search_date = Date.today
    @order = Order.where(created_at: search_date.in_time_zone.all_day)
  end
end
