class AddLongituteLatitudeStateToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :longitude, :string
    add_column :users, :latitude, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :address, :string
    add_column :users, :zip_code, :text
  end
end
