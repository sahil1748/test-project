class LaptopSpec < ApplicationRecord
  belongs_to :laptop
  validate :RamValidator,:HddValidator
  
  def RamValidator 
  	if ram.match? (/\A\d{1,2}[gb]/)
  	  puts true
  	else 
  	  errors.add(:ram,"invalid ram spec")
  	end
  end

  def HddValidator
  	if hdd.match? (/\A\d{1,3}[gb|tb]/)
  	  puts true
  	else 
  	  errors.add(:hdd,"invalid hdd spec")
  	end
  end
end
