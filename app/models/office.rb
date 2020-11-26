class Office < ApplicationRecord
  has_many :rooms

  validates :name, presence: true
  validates :address, presence: true
end
