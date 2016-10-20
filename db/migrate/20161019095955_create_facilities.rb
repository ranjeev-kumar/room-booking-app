class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
