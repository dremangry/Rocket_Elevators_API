class Building < ApplicationRecord
  belongs_to :customer
  has_many :batteries
  # has_one :building_details
end
