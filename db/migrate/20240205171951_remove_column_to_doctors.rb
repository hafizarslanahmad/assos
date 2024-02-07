class RemoveColumnToDoctors < ActiveRecord::Migration[7.1]
  def change
    remove_column :doctors, :doctor_id, :string
  end
end
