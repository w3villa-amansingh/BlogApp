class Article < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :description, presence: true
    validates_uniqueness_of :title
    #self.per_page = 3
end
