class ApplicationController < ActionController::Base
  helper_method :logged_in?
  helper_method :current_user

  def authentication
    if session[:user_id] == ''
      redirect_to user_login_path
    end
  end

  def current_user
  	User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def order_exists?(user_id)
    if User.find(user_id).orders.find_by("payment_status != 'received'")
      return true
    else 
      return false
    end
  end

  def item_exists?(order_id,laptop_id)
    if OrderProduct.find_by(order_id: order_id, laptop_id: laptop_id)
      return true
    else 
      return false
    end
  end

  def completed_orders_exists?(user_id)
    if User.find(user_id).orders.find_by("payment_status != 'not received'")
      return true
    else 
      return false
    end
  end

  def find_products(user_id)
    if order_exists?(user_id)
      @products_info = User.find(user_id).orders.find_by("payment_status != 'received'").order_products
 	    @products = Array.new(@products_info.length){Hash.new}  #@product_info.length
 	    @products_info.each{|p| 
 	      @products[@products_info.index(p)]['name'] = Laptop.find(p.laptop_id).name
 	      @products[@products_info.index(p)]['price'] = Laptop.find(p.laptop_id).price
 	      @products[@products_info.index(p)]['quantity'] = p.quantity 
 	    }   
    end	
  end
end
