class AddDataToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :name, :string
    add_column :products, :price, :decimal
    add_column :products, :description, :string
    add_column :products, :weight, :decimal
    add_column :products, :screen, :string
    add_column :products, :memory, :string
  end
end
