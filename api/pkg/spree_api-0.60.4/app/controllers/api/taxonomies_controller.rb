class Api::TaxonomiesController < Api::BaseController
     
    public
    def destroy
           puts params[:id]
      @object=Spree::Taxonomy.find_by_id(params[:id])
       @object.destroy
      if @object.destroy
      render :text => "Status => Success", :status => 201
    end
  end 
end
