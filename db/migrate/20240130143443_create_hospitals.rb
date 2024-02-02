class CreateHospitals < ActiveRecord::Migration[7.1]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :city
      t.belongs_to :user

      t.timestamps
    end
  end
end
