class Api::LineItemsController < Api::BaseController

  private
    def parent
      if params[:order_id]
        @parent ||= Order.find_by_param(params[:order_id])
      end
    end
  
    def parent_data
      params[:order_id]
    end
    
    def collection_serialization_options
      { :include => [:variant], :methods => [:description] }
    end

    def object_serialization_options
      collection_serialization_options
    end
 public
    def create
      quantity = params[:line_item][:quantity]
      @variant = Variant.find_by_id(params[:line_item][:variant_id])
      @order = current_order(true)
      @order.add_variant(@variant, quantity.to_i) if quantity.to_i > 0
      @response = Order.find_by_id(@order.id)
      render :json => @response.to_json, :status => 201
    end
    def destroy
      @object=LineItem.find_by_id(params[:id])
       @object.destroy
      if @object.destroy
      render :text => 'Destroyed' 
    end
  end
end
