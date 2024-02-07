class RemoveColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :doctor_id, :string
  end
end
