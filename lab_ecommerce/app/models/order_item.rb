class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :product

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "updated_at"]
    end
end
