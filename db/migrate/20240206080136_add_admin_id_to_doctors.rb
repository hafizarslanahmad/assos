class AddAdminIdToDoctors < ActiveRecord::Migration[7.1]
  def change
    add_column :doctors, :admin_id, :string
  end
end
