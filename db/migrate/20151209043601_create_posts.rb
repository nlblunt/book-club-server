class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :book, index: true
      t.belongs_to :user, index: true
      t.string     :title
      t.text       :body
      t.timestamps :post_date
      t.timestamps :edit_date
      t.timestamps null: false
    end
  end
end
