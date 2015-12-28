class BcsController < ApplicationController
    def status_check
        render :nothing => true, status: :ok
    end
    
    #Create a new user
    def create_user
        user = User.create(user_params)
        
        if user.valid?
            #Create a default bookshelf for the new users
            user.bookshelves.create(name: "Default", description: "Default bookshelf")
            
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
    def add_book_google
        book = Book.create(book_params)
        
        if book.valid?
            #Book was added to library
            #Add book to users bookshelf
            user = User.find_by_id(params[:user_id])
            
            shelf = user.bookshelves.first
            shelf.books << book
            
            shelf = user.bookshelves.first
            pp shelf.shelfitems
            
            if params[:finished] == "true"
                shelf.shelfitems.last.finished = true
                #shelf.shelfitems.last
                shelf.shelfitems.last.save
            end
            #si.finished = params[:finished]
            #si.save
            
            render json: {msg: "Successfully created " + book.title, shelf: shelf.books}, :status => :created
        else
            render json: {e: "Error creating book"}, :status => :error
        end
    end
    
    #Adds a book that is already on the server
    def add_book_server
        user = User.find_by_id(params[:user_id])
        
        shelf = user.bookshelves.first
        shelf.books << Book.find_by_id(params[:book_id])
        
        render json: {msg: "Successfully added book " + book.title}
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
    
    #Gets the list of books the user has added to their shelves
    def get_user_books
        user = User.find_by_id(params[:user_id])
        shelves = user.bookshelves
        
        @books = Array.new
        
        shelves.each do |s|
            s.books.each do |book|
                @books << book
            end
        end
        
        #books = Book.where(user_id: params[:user_id])
        
        render json: @books
    end
    
    #Gets the list of CURRENTLY READING (finished=false) books
    def get_current_books
        user = User.find_by_id(params[:user_id])
        shelves = user.bookshelves
        
        @books = Array.new
        
        shelves.each do |s|
            s.shelfitems.each do |shelf|
                if shelf.finished == false
                    @books << shelf.book
                end
            end
        end
        
        render json: @books
    end
    
    #Returns a list of posts for selected book AKA forum
    def get_book_forum
        book = Book.find_by_id(params[:book_id])
        @posts = book.posts
        
        #render json: book.posts
    end
    
    #Add a post
    def add_post
        #Find the book and user
        book = Book.find_by_id(params[:book_id])
       
        user = User.find_by_id(params[:user_id])
        
        book.posts.create(title: params[:post_title], body: params[:post_body], user_id: params[:user_id])
    
        #Return a new list of posts for book
        @posts = book.posts
        
        render :get_book_forum
    end
    
    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
    
    def book_params
        params.require(:book).permit(:title, :author, :description, :cover, :pages, :google_id)
    end
    
    
end
