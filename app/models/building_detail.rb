class BuildingDetail < ApplicationRecord
  belongs_to :building, dependent: :destroy
end
