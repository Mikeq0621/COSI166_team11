class ChangeZipcodeColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :hosts, :zip_code,:text, using: 'zip_code::text' 
  end
end
