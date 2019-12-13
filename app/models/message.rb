# == Schema Information
#
# Table name: messages
#
#  id                :integer          not null, primary key
#  message_sent      :string
#  receiver_username :string
#  receiver_venmo    :string
#  sender_username   :string
#  sender_venmo      :string
#  sent_since        :time
#  sent_since_date   :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  receiver_id       :integer
#  sender_id         :integer
#

class Message < ApplicationRecord
end
