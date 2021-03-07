class CreateHosts < ActiveRecord::Migration[6.1]
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone_number
      t.string :address
      t.string :city
      t.integer :zip_code

      t.timestamps
    end
  end
end
