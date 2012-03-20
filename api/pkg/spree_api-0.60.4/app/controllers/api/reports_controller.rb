class Api::ReportsController < Api::BaseController
  def sales_total
     @search = Order.metasearch(params[:search])
      @item_total = @search.sum(:item_total)
        @adjustment_total = @search.sum(:adjustment_total)
        @sales_total = @search.sum(:total)
    end
end