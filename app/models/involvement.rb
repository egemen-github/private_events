class Involvement < ApplicationRecord
  validates :attendee_id, uniqueness: { scope: :event_id }
  belongs_to :attendee, class_name: 'User'
  belongs_to :event, class_name: 'Event'
end
