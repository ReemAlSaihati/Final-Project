class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.integer :owner_id
      t.string :title
      t.float :price
      t.string :image
      t.boolean :availability, { :default => true }
      t.string :author

      t.timestamps
    end
  end
end
