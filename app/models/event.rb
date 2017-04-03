class Event < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  belongs_to :creator, class_name: "User"
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, foreign_key: "user_id"

  def Event.past
    Event.all.where("date < ?", Time.now)
  end

  def Event.future
    Event.all.where("date > ?", Time.now)
  end
end
