class Api::Checkout1Controller < CheckoutController

  #~ ssl_required

  #~ before_filter :load_order
  #~ rescue_from Spree::GatewayError, :with => :rescue_from_spree_gateway_error
	
 #~ respond_to :json
	#~ def update_order
		#~ @order = current_order
    #~ if @order.update_attributes(object_params)
			#~ puts @order.state
      #~ if @order.next
        #~ state_callback(:after)
      #~ else
        #~ #flash[:error] = I18n.t(:payment_processing_failed)
         #~ render :json => @order.errors, :status => 422
        #~ return
      #~ end
			#~ puts @order.state
      #~ if @order.state == "complete" || @order.completed?
        #~ flash[:notice] = I18n.t(:order_processed_successfully)
        #~ flash[:commerce_tracking] = "nothing special"
         #~ render :json => @order.to_json, :status => 201
       #~ else
        #~ respond_with(@order, :location => checkout_state_path(@order.state))
       #~ end
    #~ else
      #~ render :json => @order.errors, :status => 422
      #~ #respond_with(@order) { |format| format.html { render :edit } }
    #~ end
	#~ end
	
	 #~ private

  #~ # Provides a route to redirect after order completion
  #~ def completion_route
    #~ order_path(@order)
  #~ end

  #~ def object_params
    #~ # For payment step, filter order parameters to produce the expected nested attributes for a single payment and its source, discarding attributes for payment methods other than the one selected
    #~ if @order.payment
      #~ if params[:payment_source].present? && source_params = params.delete(:payment_source)[params[:order][:payments_attributes].first[:payment_method_id].underscore]
        #~ params[:order][:payments_attributes].first[:source_attributes] = source_params
      #~ end
      #~ if (params[:order][:payments_attributes])
        #~ params[:order][:payments_attributes].first[:amount] = @order.total
      #~ end
    #~ end
    #~ params[:order]
  #~ end

  #~ def load_order
    #~ @order = current_order
    #~ render :text => 'Order Not Available / Checkout Not Possible' and return unless @order and @order.checkout_allowed?
    #~ render :text => 'Order Already Completed' and return if @order.completed?
    #~ @order.state = params[:state] if params[:state]
    #~ state_callback(:before)
  #~ end

  #~ def state_callback(before_or_after = :before)
    #~ method_name = :"#{before_or_after}_#{@order.state}"
    #~ send(method_name) if respond_to?(method_name, true)
  #~ end

  #~ def before_address
    #~ @order.bill_address ||= Address.default
    #~ @order.ship_address ||= Address.default
  #~ end

  #~ def before_delivery
    #~ return if params[:order].present?
    #~ @order.shipping_method ||= (@order.rate_hash.first && @order.rate_hash.first[:shipping_method])
  #~ end

  #~ def before_payment
    #~ current_order.payments.destroy_all if request.put?
  #~ end

  #~ def after_complete
    #~ session[:order_id] = nil
  #~ end

  #~ def rescue_from_spree_gateway_error
    #~ flash[:error] = t('spree_gateway_error_flash_for_checkout')
    #~ render :edit
  #~ end
end