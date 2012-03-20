class Api::AdjustmentsController < Api::BaseController
    public
    def destroy
     puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
      puts params[object_name]
       puts params[:id]
      @object=Adjustment.find_by_id(params[:id])
       @object.destroy
      if @object.destroy
      render :text => 'Destroyed Successfully' 
    end
  end
end
