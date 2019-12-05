# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  address         :string
#  email           :string
#  password_digest :string
#  phone_number    :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  validates :phone_number, :presence => { :message => "Must have a phone number" }
  validates :username, :presence => { :message => "Must have a username" }

end
