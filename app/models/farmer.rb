class Farmer < ActiveRecord::Base
    attr_accessible :name, :phone, :village, :taluk, :district
    validates :name,  presence: true, length: { maximum: 50 }
    valid_phone_regex = /\A[\d]{10}\z/
    validates :phone,  presence: true, length: { maximum: 10 }, format: {with:valid_phone_regex}, uniqueness: true
    validates :village,  presence: true, length: { maximum: 25 }
    validates :taluk,  presence: true, length: { maximum: 25 }
    validates :district,  presence: true, length: { maximum: 20 }
end
