class Village < ActiveRecord::Base
	belongs_to :taluk
	validates :name,  presence: true, length: { maximum: 30 }
end
