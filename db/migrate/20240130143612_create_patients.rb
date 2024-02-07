class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :diseas
      t.string :ward_name
      t.belongs_to :doctor

      t.timestamps
    end
  end
end
