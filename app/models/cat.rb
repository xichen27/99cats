# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_day   :date             not null
#  color       :string(255)      not null
#  name        :string(255)      not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Cat < ActiveRecord::Base
  COLORS = [
    "brown",
    "white",
    "black",
    "Asian"
  ]
  
  SEX = [
    "M",
    "F"
  ]
  
  validates_date :birth_day, :before => Date.today
  validates :name, :sex, :color, :birth_day, presence: true
  validates :color, inclusion: COLORS
  validates :sex, inclusion: SEX
  
  has_many :cat_rental_requests
  
  def age
    (Date.today - birth_day).to_i/365
  end
  
  belongs_to(
    :owner,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )
  
end
