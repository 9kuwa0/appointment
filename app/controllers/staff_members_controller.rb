class StaffMembersController < ApplicationController

  def index
    @patients = Patient.order(:room)
  end

end
