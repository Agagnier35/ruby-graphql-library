class CreateBooks < ActiveRecord::Migration[8.0]
  extend T::Sig

  def change
    create_table :books do |t|
      t.belongs_to :author
      t.belongs_to :publisher

      t.string :title
      t.string :genre

      # international standard book number (idk what it actually stands for)
      t.string :isbn

      t.timestamps
    end
  end
end
