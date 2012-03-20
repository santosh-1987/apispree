class Spree::Api::ShippingMethodsController < Spree::Api::BaseController

      # Looks like this action is unused
      # def filtered
        # @properties = Property.where('lower(name) LIKE ?', "%#{params[:q].mb_chars.downcase}%").order(:name)
        # respond_with(@properties) do |format| 
          # format.html { render :template => "spree/admin/properties/filtered", :formats => [:html], :handlers => [:erb], :layout => false } 
        # end
      # end
    # end
  # end
   public
    def destroy
     puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
      
       puts params[:id]
      @object=Spree::ShippingMethod.find_by_id(params[:id])
       @object.destroy
      if @object.destroy
      render :text => "Status => Success", :status => 201
    end
  end
  
end
