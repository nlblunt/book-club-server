class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :author
      t.string :cover
      t.integer :pages

      t.timestamps null: false
    end
    
    create_table :shelfitems, id: false do |t|
      t.belongs_to :book, index: true
      t.belongs_to :bookshelf, index: true
      t.integer    :page, default: 0
      t.boolean       :finished, default: false
    end
  end
end
