 class Api::TaxonsController < Api::BaseController
# def index
      # @taxons=Spree::Taxon.all
      # puts @taxons
    # end
    public
    def destroy
           puts params[:id]
      @object=Spree::Taxon.find_by_id(params[:id])
       @object.destroy
      if @object.destroy
      render :text => "Status => Success", :status => 201
    end
  end 
    
    
end
