class User < ApplicationRecord
    enum position: {
        ensign:0,
        lieutinent:1,
        captain:2,
        vice_admiral:3,
        admiral:4,
        fleet_admiral:5,
        gorosei:6

    }
    validates :username, presence:true, length: {minimum:3,maximum:25}, uniqueness: {case_sensitivity:false}
    validates :password_digest, presence:true
    validates :name, presence:true
    has_many :sightings
    has_many :pirates, :through => :sightings
    has_one_attached :image
    has_secure_password
end