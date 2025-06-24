class StaffMembers::SessionsController < ApplicationController

  def new
    @staff_member = StaffMember.new
  end

  def create
    @staff_member = StaffMember.find_by(email: params[:staff_member][:email])

    if @staff_member&.valid_password?(params[:staff_member][:password])
      sign_in(:staff_member, @staff_member)
      redirect_to promises_path
    else
      @staff_member = StaffMember.new(email: params[:staff_member][:email])
      @staff_member.errors.add(:base, "メールアドレスまたはパスワードが正しくありません")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out(:staff_member)
    redirect_to root_path
  end

end