# frozen_string_literal: true

class Families::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  # skip_before_action :authenticate_family!, only: [:new, :create, :destroy]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  private
  
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
