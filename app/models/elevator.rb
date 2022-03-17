class Elevator < ApplicationRecord
  belongs_to :column, dependent: :destroy
end
