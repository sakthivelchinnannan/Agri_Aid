class State < ActiveRecord::Base
    has_many :districts, foreign_key: "state_cd", dependent: :destroy
	validates :name,  presence: true, length: { maximum: 20 }
end
