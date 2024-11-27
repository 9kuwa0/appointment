class StaffMembersController < ApplicationController

  # skip_before_action :authenticate_staff_member!, only: [:new, :create]

  def index
    @patients = Patient.order(:room)
  end

end
