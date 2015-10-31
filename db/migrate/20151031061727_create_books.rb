class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :author
      t.string :cover

      t.timestamps null: false
    end
    
    create_table :books_bookshelves, id: false do |t|
      t.belongs_to :book
      t.belongs_to :bookshelf
    end
  end
end
