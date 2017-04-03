class User < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :owned_events, class_name: "Event", foreign_key: "creator_id"
  has_many :attendances, dependent: :destroy, foreign_key: "attendee_id"
  has_many :attended_events, through: :attendances, source: :event

  def upcoming_events
    self.attended_events.where("date > ?", Time.now)
  end

  def previous_events
    self.attended_events.where("date < ?", Time.now)
  end
end
