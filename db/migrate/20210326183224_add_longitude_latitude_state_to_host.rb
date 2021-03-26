class AddLongitudeLatitudeStateToHost < ActiveRecord::Migration[6.1]
  def change
    add_column :hosts, :longitude, :string
    add_column :hosts, :latitude, :string
    add_column :hosts, :state, :string
  end
end
