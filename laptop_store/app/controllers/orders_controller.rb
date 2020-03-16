class OrdersController < ApplicationController
  def show
    if session[:user_id]!=''
      @order_exists = true 
      @user_id = session[:user_id]	
      if completed_orders_exists?(@user_id)
        @orders = User.find(@user_id).orders.where("payment_status != 'not received'")
      else
      	@order_exists = false
      end

  	else
  	  redirect_to user_login_path
  	end	
  end

end