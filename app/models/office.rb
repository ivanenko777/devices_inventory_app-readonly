class Office < ApplicationRecord
  has_many :rooms

  validates :name, presence: true
  validates :address, presence: true

  def office_info_for_select
    "#{name}, #{address} #{'(Inactive)' if !is_active}"
  end
end
