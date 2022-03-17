class Battery < ApplicationRecord
  belongs_to :building, dependent: :destroy
  has_many :columns
end
