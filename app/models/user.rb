class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, foreign_key: 'creator', class_name: 'Event', dependent: :destroy
  has_many :involvements, foreign_key: 'attendee_id', class_name: 'Involvement'
end
