class AddPasswordDigestToHosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :hosts,:password, :password_digest
  end
end
