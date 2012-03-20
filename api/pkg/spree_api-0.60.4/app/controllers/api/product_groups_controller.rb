class Api::ProductGroupsController < Api::BaseController
       public
    def destroy
     puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
      puts params[object_name]
       puts params[:id]
      @object=ProductGroup.find_by_id(params[:id])
       @object.destroy
      if @object.destroy
      render :text => 'Destroyed' 
    end
  end
  
end
