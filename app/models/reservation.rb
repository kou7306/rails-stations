class Reservation < ApplicationRecord
    belongs_to :schedule
    belongs_to :sheet
    
 
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates_uniqueness_of :sheet_id, scope: [:schedule_id, :date]
end
