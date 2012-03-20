class Machinery < ActiveRecord::Base
    has_many :lendablemachineries, foreign_key: "machinery_id", dependent: :destroy

end
