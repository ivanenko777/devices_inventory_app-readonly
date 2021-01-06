# https://gist.github.com/kule/9425fb7d4c2a13e556ef
# (concern) e.g. for Post model
module UserTrackable

  extend ActiveSupport::Concern

  included do
    before_create :set_created_by
    before_save   :set_updated_by

    belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id', optional: true
    belongs_to :updated_by, class_name: 'User', foreign_key: 'updated_by_id', optional: true

    scope :created_by, ->(user) { where(created_by_id: user.id) }
    scope :updated_by, ->(user) { where(updated_by_id: user.id) }
  end

  protected

  def set_created_by
    self.created_by = User.curr_user
    true
  end

  def set_updated_by
    self.updated_by = User.curr_user
    true
  end

end