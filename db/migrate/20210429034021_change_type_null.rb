class ChangeTypeNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :notifications,:type,true
  end
end
