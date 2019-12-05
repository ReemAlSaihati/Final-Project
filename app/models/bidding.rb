# == Schema Information
#
# Table name: biddings
#
#  id             :integer          not null, primary key
#  bidding_amount :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  bidder_id      :integer
#  book_id        :integer
#

class Bidding < ApplicationRecord
end
