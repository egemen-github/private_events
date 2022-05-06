class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :time, presence: true
  validates :date, presence: true
  belongs_to :creator, class_name: 'User'
  has_many :involvements
  has_many :attendees, through: :involvements, source: :attendee
end
