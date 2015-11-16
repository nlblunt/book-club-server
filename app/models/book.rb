class Book < ActiveRecord::Base
    has_many :shelfitems
    has_many :bookshelves, through: :shelfitems
    
   validates :title, :author, :google_id, presence: true
   validates :google_id, uniqueness: true
end
