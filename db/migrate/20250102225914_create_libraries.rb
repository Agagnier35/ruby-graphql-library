class CreateLibraries < ActiveRecord::Migration[8.0]
  def change
    create_table :libraries do |t|
      t.string :name

      t.integer :street_number
      t.string :street
      t.string :city

      t.timestamps
    end
  end
end
