class BcsController < ApplicationController
    def status_check
        render :nothing => true, status: :ok
    end
    
    #Create a new user
    def create_user
        user = User.create(user_params)
        
        if user.valid?
            render :nothing => true, :status => :created
        else
            render :nothing => true, :status => :error
        end
    end
    
    #Check to see if user is signed in
    def user_check
       if user_signed_in?
           render status: :ok, json: current_user
       else
           render status: :forbidden, nothing: true
       end
    end
    
    #Create a book from Google Books API
    def create_book
        book = Book.create(book_params)
        
        if book.valid?
            render json: {msg: "Successfully created " + book.title}, :status => :created
        else
            render json: {e:"Error creating book"}, :status => :error
        end
    end
    
    #Return a list books added to bcs
    def list_books
        books = Book.all
        
        if books.count > 0
            render json: books
        else
            render json: {e:"No books added"}, :status => :error
        end
    end
    
    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
    
    def book_params
        params.require(:book).permit(:title, :author, :description, :cover, :pages, :google_id)
    end
end
