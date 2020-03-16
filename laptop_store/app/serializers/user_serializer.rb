class UserSerializer < ActiveModel::Serializer

  def attributes(*args)
  	data = super
  	data[:username] = object.username
  	data[:name] = object.name
  	data[:phoneno] = object.phoneno
  	data[:email] = object.email
  	data[:address] = object.address
  	data[:orders] = ActiveModel::Serializer::CollectionSerializer.new(object.orders, each_serializer: OrderSerializer)

  	data 
  end
end
