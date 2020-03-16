module Api
  module V1
    class LaptopsController < MainController
      def index
        laptops = Laptop.all
        render json: {laptops: ActiveModel::Serializer::CollectionSerializer.new(laptops, each_serializer: LaptopSerializer), status: 200, message: 'loaded laptops'}
      end

      def show
        laptop = Laptop.find(params[:id])
        render json: {data: LaptopSerializer.new(laptop), status: 'SUCCESS', message: 'loaded laptop'}
      end
      def update
        laptop = Laptop.find(params[:id])
        if laptop.update(laptop_params)
          render json: {data: laptop, status: 'SUCCESS', message: 'laptop updated'} 
        else 
          render json: {data: laptop.errors, status: 'FAILURE', message: 'laptop not updated'} 
        end
      end
      def destroy
        laptop = Laptop.find(params[:id])
        spec = laptop.laptop_spec
        if spec
          spec.delete
        end
        if laptop.delete
          render json: {status: 'SUCCESS', message: 'laptop deleted'} 
        else 
          render json: {data: laptop, status: 'FAILURE', message: 'laptop not deleted'} 
        end
      end

      private
      def laptop_params
        params.require(:laptop).permit(:brand,:name,:price,:quantity)
      end

    end
  end
end
