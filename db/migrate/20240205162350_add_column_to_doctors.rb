class AddColumnToDoctors < ActiveRecord::Migration[7.1]
  def change
    add_column :doctors, :doctor_id, :string
  end
end
