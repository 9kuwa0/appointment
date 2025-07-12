class Families::SessionsController < ApplicationController

  def new
    @family = Family.new
  end

  def create
    @family = Family.find_by(email: params[:family][:email])

    if @family&.valid_password?(params[:family][:password])
      sign_in(:family, @family)
      redirect_to patients_path
    else
      @family = Family.new(email: params[:family][:email])
      @family.errors.add(:base, "メールアドレスまたはパスワードが正しくありません")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out(:family)
    redirect_to root_path
  end

end
