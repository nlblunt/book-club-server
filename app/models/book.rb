class Book < ActiveRecord::Base
    has_many :shelfitems
    has_many :bookshelves, through: :shelfitems
    
   validates :title, :author, presence: true
end
