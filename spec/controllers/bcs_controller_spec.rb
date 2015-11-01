require 'rails_helper'

RSpec.describe BcsController, type: :controller do
    describe "Create Book" do
       it "With Required params Adds a book" do
           post :create_book, {book:{title: "Harry Potter", author: "JK", description: "Some Book"}}
           
           resp = JSON.parse(response.body)
           expect(response.status).to eq(201)
           
           expect(resp['msg']).to eq("Successfully created Harry Potter")
           
       end
       
       it "With no TITLE Fails" do
           post :create_book, {book:{title: nil, author: "JK", description: "Some Book"}}
           
           resp = JSON.parse(response.body)
           expect(response.status).to eq(500)
           
           expect(resp['e']).to eq("Error creating book")
       end
       
       it "With no AUTHOR Fails" do
           post :create_book, {book:{title: "Harry Potter", author: nil, description: "Some Book"}}
           
           resp = JSON.parse(response.body)
           expect(response.status).to eq(500)
           
           expect(resp['e']).to eq("Error creating book")
       end
    end
end
