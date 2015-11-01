class BcsController < ApplicationController
    def status_check
        render :nothing => true, status: :ok
    end
    
    def create_user
        user = User.create(user_params)
        
        if user.valid?
            render :nothing => true, :status => :created
        else
            render :nothing => true, :status => :error
        end
    end
    
    def user_check
       if user_signed_in?
           render status: :ok, json: current_user
       else
           render status: :forbidden, nothing: true
       end
    end
    
    #Create a book from Google Books API
    def create_book
            
    end
    
    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
    
    def book_params
        params.require(:book).permit(:title, :author, :description, :cover, :pages, :google_id)
    end
end
