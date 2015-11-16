require 'rails_helper'

RSpec.describe BcsController, type: :controller do
    describe "POST Create Book" do
       it "With Required params Adds a book" do
           post :add_book_google, {book:{title: "Harry Potter", author: "JK", description: "Some Book", google_id: "AAA1"}}
           
           resp = JSON.parse(response.body)
           expect(response.status).to eq(201)
           
           expect(resp['msg']).to eq("Successfully created Harry Potter")
           
       end
       
       it "With no TITLE Fails" do
           post :add_book_google, {book:{title: nil, author: "JK", description: "Some Book", google_id: "AAA1"}}
           
           resp = JSON.parse(response.body)
           expect(response.status).to eq(500)
           
           expect(resp['e']).to eq("Error creating book")
       end
       
       it "With no AUTHOR Fails" do
           post :add_book_google, {book:{title: "Harry Potter", author: nil, description: "Some Book", google_id: "AAA1"}}
           
           resp = JSON.parse(response.body)
           expect(response.status).to eq(500)
           
           expect(resp['e']).to eq("Error creating book")
       end
       
       it "With no GOOGLE_ID Fails" do
           post :add_book_google, {book:{title: "Harry Potter", author: "JK", description: "Some Book", google_id: nil}}
           
           resp = JSON.parse(response.body)
           expect(response.status).to eq(500)
           
           expect(resp['e']).to eq("Error creating book")
       end
    end
    
    describe "GET list_books" do
       it "Returns a list of all books" do
           #Add 3 books
           FactoryGirl.create(:book, title: "HP1")
           FactoryGirl.create(:book, title: "HP2")
           FactoryGirl.create(:book, title: "HP3")
          get :list_books
          
          resp = JSON.parse(response.body)
          expect(response.status).to eq(200)
          
          expect(resp.count).to eq(3)
          expect(resp[0]['title']).to eq("HP1")
          expect(resp[2]['title']).to eq("HP3")
       end
    end
    
    describe "POST add_book_to_user_shelf" do
       it "Adds a book to 'Default' shelf" do
           
       end
    end
end
