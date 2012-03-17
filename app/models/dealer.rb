class Dealer < ActiveRecord::Base
    attr_accessible :name, :phone, :email, :street, :taluk, :district
end
