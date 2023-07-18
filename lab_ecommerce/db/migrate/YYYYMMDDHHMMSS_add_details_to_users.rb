class AddDetailsToUsers < ActiveRecord::Migration[6.1]
    def change
      add_column :users, :name, :string
      add_column :users, :email, :string
      add_column :users, :phone, :string
      add_column :users, :shipping_address, :string
    end
end