class OrderProduct < ApplicationRecord
   belongs_to :order
   belongs_to :laptop
   has_one :laptop_spec, through: :laptop
end
