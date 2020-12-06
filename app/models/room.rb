class Room < ApplicationRecord
  belongs_to :office
  has_many :devices

  scope :active, -> { joins(:office).where('rooms.is_active = 1 AND offices.is_active = 1') }
  scope :filter_by_is_active, ->(active) { where is_active: active }
  scope :filter_by_office_id, ->(office_id) { where office_id: office_id }
  scope :filter_by_room_name_contains, ->(text) { where('rooms.name LIKE ?', "%#{text}%") }
  scope :order_by_room_name_asc, -> { order('rooms.name ASC') }
  scope :order_by_room_name_desc, -> { order('rooms.name DESC') }
  scope :order_by_office_name_asc, -> { joins(:office).order('offices.name ASC') }
  scope :order_by_office_name_desc, -> { joins(:office).order('offices.name DESC') }
  scope :order_by_office_address_asc, -> { joins(:office).order('offices.address ASC') }
  scope :order_by_office_address_desc, -> { joins(:office).order('offices.address DESC') }

  validates :name, presence: true
  validates :office_id, presence: true

  def room_info_for_select
    "#{office.address} - #{name}"
  end
end
