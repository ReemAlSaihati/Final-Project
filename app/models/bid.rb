# == Schema Information
#
# Table name: bids
#
#  id              :integer          not null, primary key
#  bidding_amount  :integer
#  book_owner_name :string
#  book_title      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  bidder_id       :integer
#  book_id         :integer
#

class Bid < ApplicationRecord
end
