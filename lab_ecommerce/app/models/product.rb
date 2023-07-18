class Product < ApplicationRecord
    has_many :order_items
    has_one_attached :image

    validates :price, :name, :description, :weight, :screen, :memory, presence: true
    validates :price, :weight, numericality: { greater_than_or_equal_to: 0 }

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "memory", "name", "price", "screen", "updated_at", "weight"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["order_items", 'image_attachment']
    end
end
