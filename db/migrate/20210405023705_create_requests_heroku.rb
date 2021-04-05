class CreateRequestsHeroku < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.references :host, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
