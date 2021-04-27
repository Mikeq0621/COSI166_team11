class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :host
      t.integer :stars
      t.string :comment

      t.timestamps
    end
  end
end
