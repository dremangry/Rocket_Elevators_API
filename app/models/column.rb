class Column < ApplicationRecord
  belongs_to :battery, dependent: :destroy
  has_many :elevators
end
