class ApplicationController < ActionController::Base
  before_action :authenticate_staff_member!

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(StaffMember)
      staff_member_index_path
    elsif resource.is_a?(Family)
      family_index_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == (:staff_member || :family)
      root_path
    end
  end
end