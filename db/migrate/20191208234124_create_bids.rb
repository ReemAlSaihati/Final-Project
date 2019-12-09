class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.integer :bidder_id
      t.integer :book_id
      t.integer :bidding_amount
      t.string :book_owner_name
      t.string :book_title

      t.timestamps
    end
  end
end
