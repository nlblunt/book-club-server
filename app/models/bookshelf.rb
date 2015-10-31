class Bookshelf < ActiveRecord::Base
  belongs_to :user
  
  has_many :shelfitems
  has_many :books, through: :shelfitems
end
