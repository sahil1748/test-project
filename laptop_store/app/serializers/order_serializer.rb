class OrderSerializer < ActiveModel::Serializer
  
  def attributes(*args)
  	data = super
  	data[:order_id] = object.id
  	data[:user_id] = object.user_id
  	data[:payment_status] = object.payment_status
  	data
  end
end
