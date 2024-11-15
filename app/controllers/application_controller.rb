class ApplicationController < ActionController::Base
  before_action :authenticate_staff_member!

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(StaffMember)
      staff_member_dashboard_path
    # elsif resource.is_a(Family) ファミリー作成したら
    #   family_dashboard_path
    else
      root_path
    end
  end
end