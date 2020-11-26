class Room < ApplicationRecord
  belongs_to :office

  validates :name, presence: true
end
