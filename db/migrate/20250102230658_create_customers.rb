class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :telephone
      t.string :email

      t.timestamps
    end
  end
end
