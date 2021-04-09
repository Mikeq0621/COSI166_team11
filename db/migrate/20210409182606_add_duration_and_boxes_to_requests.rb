class AddDurationAndBoxesToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :boxes,:integer
    add_column :requests, :duration, :integer
  end
end
