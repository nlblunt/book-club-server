class BcsController < ApplicationController
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
           #render status: :forbidden, nothing: true
           render status: :ok, nothing: true
       end
    end
    
    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
end
