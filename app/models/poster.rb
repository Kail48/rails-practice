class Poster < ApplicationRecord
    enum status: {
        "dead or alive":0,
        "only dead":1,
        "only alive":2,
    }
    belongs_to :pirate
    validates :pirate_id, presence:true
end