# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # after_action :after_sign_in, :only => :create
  # def after_sign_in
  #    flash[:message_of_the_day] = "Welcome to our site!" 
  # end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  #   flash[:success] = "Welcome to Private Events!"
  # end

  # DELETE /resource/sign_out
  def destroy
    super
    flash[:see_you] = "See you!"
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
