class AddBoxesToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :boxes, :integer
  end
end
