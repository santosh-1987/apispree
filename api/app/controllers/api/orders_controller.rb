class Api::OrdersController < Api::BaseController
  before_filter :access_denied, :except => [:index, :show,:create,:update]

  private

    def find_resource
      Order.find_by_param(params[:id])
    end

    def object_serialization_options
      { :include => {
          :bill_address => {:include => [:country, :state]},
          :ship_address => {:include => [:country, :state]},
          :shipments => {:include => [:shipping_method, :address]},
          :line_items => {:include => [:variant]}
          }
      }
    end
  public
  def update
    @object=Order.find_by_id(params[:id])
    if @object.update_attributes(params[object_name])
      
      @response=Order.find_by_id(@object.id)
      render :json => @response.to_json, :status => 201
    else
      respond_with(@object.errors, :status => 422)
    end
  end
    def destroy
@object=Order.find_by_id(params[:id])
@object.destroy
if @object.destroy
   render :text => 'Destroyed' 
 end

  end
  
    #~ def create
      #~ @order = Order.new
      #~ @order.user_id = current_user.id
    #~ if @order.save
      #~ #render :text => "Resource created\n", :status => 201, :location => object_url
      #~ #render :text => @object.to_json, :status => 201, :location => object_url
      #~ render :json => @object.to_json, :status => 201
    #~ else
      #~ respond_with(@object.errors, :status => 422)
    #~ end
  #~ end

end
