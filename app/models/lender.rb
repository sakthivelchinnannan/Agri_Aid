class Lender < ActiveRecord::Base
    has_many :lendablemachineries, foreign_key: "lender_id", dependent: :destroy
    attr_accessible :name, :phone, :email, :street, :taluk, :district
    before_save :create_remember_token
	validates :name,  presence: true, length: { maximum: 50 }
    valid_phone_regex = /\A[\d]{10}\z/
    validates :phone,  presence: true, length: { maximum: 10 }, format: {with:valid_phone_regex}
    valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: valid_email_regex }, uniqueness: { case_sensitive: false }
    validates :street,  presence: true, length: { maximum: 25 }
    validates :taluk,  presence: true, length: { maximum: 25 }
    validates :district,  presence: true, length: { maximum: 20 }

	private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
