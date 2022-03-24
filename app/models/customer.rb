class Customer < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :address, dependent: :destroy
end