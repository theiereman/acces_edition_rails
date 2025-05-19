class Event < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :description, length: { minimum: 10 }
  validates :location, presence: true
  validates :date, future: true, presence: true

  validates :user, presence: true
end
