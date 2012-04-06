class Taluk < ActiveRecord::Base
    has_many :villages, foreign_key: "taluk_cd", dependent: :destroy
	belongs_to :district
	validates :name,  presence: true, length: { maximum: 20 }
end
