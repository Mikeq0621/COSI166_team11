class AddPriceToListings < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :price, :float
  end
end
