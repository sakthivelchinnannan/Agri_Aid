class Lendablemachinery < ActiveRecord::Base
	attr_accessible :machinery_id, :lender_id, :numofmachines, :rateperhr
	
	belongs_to :lender
	belongs_to :machinery
end
