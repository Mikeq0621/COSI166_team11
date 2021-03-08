class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :host_id
      t.integer :user_id
      t.float :price
      t.integer :duration

      t.timestamps
    end
  end
end
