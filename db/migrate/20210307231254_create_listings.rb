class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.integer :host_id
      t.integer :space
      t.integer :duration

      t.timestamps
    end
  end
end
