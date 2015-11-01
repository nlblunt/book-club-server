require 'rails_helper'

RSpec.describe BcsController, type: :controller do
    describe "Create Book" do
       it "Adds a book" do
           post :create_book, {book:{title: "Harry Potter", author: "JK", description: "Some Book"}}
           
           expect(response.status).to eq(:created)
       end
    end
end
