class Order < ApplicationRecord
    belongs_to :user
    has_many :order_items

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["order_items", "user"]
    end
end
