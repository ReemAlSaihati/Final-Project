class CreateBiddings < ActiveRecord::Migration[6.0]
  def change
    create_table :biddings do |t|
      t.integer :bidder_id
      t.integer :book_id
      t.integer :bidding_amount

      t.timestamps
    end
  end
end
