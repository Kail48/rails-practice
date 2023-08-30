class Pirate < ApplicationRecord
  enum status: {
    "active": 0,
    "dead": 1,
    "retired": 2
  }
  validates :name, presence: true
  belongs_to :crew
  has_one_attached :image
  has_one :poster
  has_many :sightings
  has_many :users, through: :sightings
  def change_bounty(new_bounty)
    self.bounty = new_bounty
    save
  end

  def self.import(file)
    require 'csv'
    CSV.foreach(file.path, headers: true) do |row|
      Pirate.create! row.to_hash
    end
  end
end
