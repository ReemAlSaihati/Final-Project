# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  author       :string
#  availability :boolean          default(TRUE)
#  image        :string
#  price        :float
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  owner_id     :integer
#

class Book < ApplicationRecord
  validates :owner_id, :presence => { :message => "Must have an owner_id" }
  validates :title, :presence => { :message => "Must have a title"}
  validates :price, :presence => { :message => "Must have a price"}
end
