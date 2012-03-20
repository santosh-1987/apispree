class Api::ImagesController < Spree::Api::BaseController
  
   public
    def destroy
     puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
      puts params[object_name]
       puts params[:id]
      @object=Image.find_by_id(params[:id])
       @object.destroy
      if @object.destroy
      render :text => 'Image Destroyed Successfully' 
    end
  end
      
end
