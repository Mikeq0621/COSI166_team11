class AddListingIdToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :listing_id,:integer
  end
end
