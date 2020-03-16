class LaptopSpecSerializer < ActiveModel::Serializer
  def attributes(*args)
    data = super
  	data[:ram] = object.ram
  	data[:hdd] = object.hdd
  	data[:processor] = object.processor
  	data
  end
end