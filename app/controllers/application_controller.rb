class ApplicationController < ActionController::Base

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
    case resource_or_scope
    when :staff_member
      root_path # スタッフログイン画面
    when :family
      root_path # 家族ログイン画面
    else
      root_path
    end
  end
end