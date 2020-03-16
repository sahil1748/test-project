class User < ApplicationRecord
  has_many :orders
  has_many :order_products, through: :orders
  validates :username, :name, presence: true #:address, 
  validates :name, length: {minimum: 3, too_short:"must be more than %{count} characters"} 
  validates :email, presence: true, format: {with: /\A\w+\.?\w+@[a-z]+\.[a-z]+/, message: "Enter valid email address"}
  validates :phoneno, presence: true,length: {is: 10, message: "must be of 10 digits"}
  validates :password, presence:true, confirmation: {message: "password didn't match"}
 # validates :password_confirmation, presence: true
  
  # before_validation :name_modifier

  # private
  #   def name_modifier
  #     final_name = String.new 
  #     name.each_char{|x| x.match(/[a-z|A-Z]/)?final_name<<x:final_name<<' '}
  #     final_name.squeeze!
  #     final_name.rstrip!
  #     final_name.lstrip!
  #     self.name = final_name
  #   end

end
