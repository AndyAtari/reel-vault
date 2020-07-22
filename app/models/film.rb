class Film < ActiveRecord::Base
    belongs_to :user

    def self.search(search)
        where('title like :pat or theater like :pat', :pat => "%#{search}%")
    end
    
end