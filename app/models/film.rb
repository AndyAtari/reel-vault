class Film < ActiveRecord::Base
    belongs_to :user
    validates :title, :condition, :reels, :length, presence: true

    def self.search(search)
        where('title like :pat or theater like :pat', :pat => "%#{search}%")
    end
    
end