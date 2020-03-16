class CartsController < ApplicationController

  def add_item
    if session[:user_id]!=''
      params[:item_exists] ||= false
      @laptop_id = params[:id]
      @user_id = session[:user_id]  
      if order_exists?(@user_id)        
        @order_id = User.find(@user_id).orders.find_by("payment_status = 'not received'").id
        if item_exists?(@order_id,@laptop_id)
          params[:item_exists] = true
        else  
          OrderProduct.create(order_id: @order_id, laptop_id: @laptop_id, quantity: 1)
        end
      else
        Order.create(user_id: @user_id, payment_status: 'not received')
        @order_id = User.find(@user_id).orders.find_by("payment_status = 'not received'").id 
        OrderProduct.create(order_id: @order_id, laptop_id: @laptop_id, quantity: 1)
      end
      
    else
      redirect_to user_login_path
    end
  end

  def show
    if session[:user_id]!=''
      @user_id = session[:user_id]	
      find_products(@user_id)
  	else
  	  redirect_to user_login_path
  	end	
  end

  def destroy
    @name = params[:product_name]
    @user_id = session[:user_id]
    @product_id = Laptop.find_by(name: @name).id
    User.find(@user_id).orders.find_by("payment_status != 'received'").order_products.find_by(laptop_id: @product_id).delete
    redirect_to user_cart_path
  end
end
