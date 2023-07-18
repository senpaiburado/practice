class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :orders

    validates :name, :email, :phone, :shipping_address, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "email", "id", "name", "phone", "remember_created_at", "shipping_address", "updated_at"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["orders"]
    end
end
