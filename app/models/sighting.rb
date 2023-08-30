class Sighting < ApplicationRecord
  enum alert_level: {
    "normal": 0,
    "supernova": 1,
    "yonko": 2
  }
  belongs_to :pirate
  belongs_to :user

  validates :user_id, presence: true
  validates :pirate_id, presence: true
end
