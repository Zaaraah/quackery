class CreateSicknesses < ActiveRecord::Migration
  def change
    create_table :sicknesses do |t|
      t.string :name
      t.string :symptoms
      t.text :description
      t.text :causes
      t.text :treatment

      t.timestamps
    end
  end
end
