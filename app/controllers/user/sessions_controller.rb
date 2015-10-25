class User::SessionsController < Devise::SessionsController
  
  def create
    resource = User.find_by_username(params[:username])
    
    if resource != nil
      if resource.valid_password?(params[:password])
        sign_in :user, resource

        render status: :ok, json: resource
      else
        render status: :forbidden, string: "Error" #nothing: true
      end
    else
      render status: :forbidden, nothing: true
    end
  end
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
