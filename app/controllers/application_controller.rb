class ApplicationController < ActionController::Base

  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do | username, password |
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(StaffMember)
      patients_path
    elsif resource.is_a?(Family)
      promises_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    case resource_or_scope
    when :staff_member
      root_path 
    when :family
      root_path
    else
      root_path
    end
  end
end