class Crew < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :pirates
  has_one_attached :image
  def update_bounty
    self.bounty = pirates.sum(:bounty)
    save
  end
end
