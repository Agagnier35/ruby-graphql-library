class CreateLibraryBooks < ActiveRecord::Migration[8.0]
  def change
    create_enum :book_state, [ :available, :rented ]
    create_table :library_books do |t|
      t.belongs_to :library
      t.belongs_to :book

      t.enum :state, enum_type: :book_state, default: :available
      t.integer :renting_price
      t.belongs_to :rented_by, foreign_key: { to_table: :customers }, null: true
      t.timestamp :rented_since, null: true

      t.timestamps
    end
  end
end
