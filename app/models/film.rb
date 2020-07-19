class Film < ActiveRecord::Base
    belongs_to :user

    def self.search(search)
        where("title || gauge LIKE ?", "%#{search}%")
        #where("genre LIKE ?", "%#{search}%")
    end
end