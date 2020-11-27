class Room < ApplicationRecord
  belongs_to :office

  scope :filter_by_is_active, ->(active) { where is_active: active }
  scope :filter_by_office_id, ->(office_id) { where office_id: office_id }
  scope :filter_by_room_name_contains, ->(text) { where('rooms.name LIKE ?', "%#{text}%") }

  validates :name, presence: true
  validates :office_id, presence: true
end
