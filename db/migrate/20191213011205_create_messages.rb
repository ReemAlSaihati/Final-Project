class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.string :sender_username
      t.string :receiver_username
      t.string :message_sent
      t.string :book_title

      t.timestamps
    end
  end
end
