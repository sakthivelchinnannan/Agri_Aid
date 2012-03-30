class Machinerycategory < ActiveRecord::Base
	attr_accessible :name, :description
	
    has_many :machineries, foreign_key: "machinerycategory_id"
	
end
