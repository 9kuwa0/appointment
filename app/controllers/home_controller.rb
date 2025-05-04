class HomeController < ApplicationController

  before_action :authenticate_user!, only: [:index]

  def index
  end

  private

  def authenticate_user!
    if family_signed_in?
      redirect_to promises_path
    elsif staff_member_signed_in?
      redirect_to patients_path
    end
  end
end
