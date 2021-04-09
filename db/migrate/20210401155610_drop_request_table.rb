class DropRequestTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :requests
  end
end
