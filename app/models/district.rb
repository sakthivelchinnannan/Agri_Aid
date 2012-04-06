class District < ActiveRecord::Base
    has_many :taluks, foreign_key: "district_cd", dependent: :destroy
	belongs_to :state
	validates :name,  presence: true, length: { maximum: 20 }
end
