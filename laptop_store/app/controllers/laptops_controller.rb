class LaptopsController < ApplicationController
  def new
    @laptop = Laptop.new

  end

  def create
    @laptop = Laptop.new(laptop_params)
    if @laptop.save
      redirect_to laptops_path
    else
      render :new
    end
  end

  def index
    @laptops = Laptop.all
    @specs = Array.new
    for i in 0...@laptops.length
      @specs[i] = @laptops[i].laptop_spec 
    end
  end

  def show
    @laptop = Laptop.find(params[:id])
    @spec = @laptop.laptop_spec
  end

  def edit
    @laptop = Laptop.find(params[:id])
  end

  def update
    @laptop = Laptop.find(params[:id])
    if @laptop.update(laptop_params)
      redirect_to laptops_path
    else 
      render :edit
    end
  end

  def destroy
    @laptop = Laptop.find(params[:id])
    @spec = @laptop.laptop_spec
    if @spec
      @spec.delete
    end
    if @laptop.delete
      redirect_to laptops_path
    else 
      render :show
    end
  end

  private
    def laptop_params
      params.require(:laptop).permit(:brand,:name,:price,:quantity)
    end
end
