class LaptopSerializer < ActiveModel::Serializer
  def attributes(*args)
    data = super
  	data[:laptop_id] = object.id
  	data[:brand] = object.brand
  	data[:name] = object.name
  	data[:price] = object.price
  	data[:quantity] = object.quantity
  	data[:specs] = LaptopSpecSerializer.new(object.laptop_spec)
  	data
  end
end
