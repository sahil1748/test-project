class LaptopSpecsController < ApplicationController
  def new
  	@laptop = Laptop.find(params[:laptop_id])
  	@spec = LaptopSpec.new
  end

  def create
  	@laptop = Laptop.find(params[:laptop_id])
  	@spec = LaptopSpec.new(spec_params)
  	if @spec.save
  	  redirect_to laptops_path
  	else 
  	  render :new
  	end
  end

  def edit
  	@laptop = Laptop.find(params[:laptop_id])
  	@spec = LaptopSpec.find(params[:id])  	
  end

  def update
  	@laptop = Laptop.find(params[:laptop_id])
 	@spec = LaptopSpec.find(params[:id])
 	if @spec.update(spec_params)
 	  redirect_to laptop_path(@laptop)
 	else 
 	  render :edit
 	end
  end

  private 
   def spec_params
   	 params.require(:laptop_spec).permit(:ram,:hdd,:processor,:laptop_id)
   end
end
