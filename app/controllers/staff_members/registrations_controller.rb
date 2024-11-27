class StaffMembers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    @staff_member = StaffMember.new
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:staff_number, :staff_last_name, :staff_first_name, :staff_department_id, :staff_affiliation_id])
  end
end