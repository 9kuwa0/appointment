class StaffMembersController < ApplicationController

  def index
    @patients = Patient.order("floor DESC")
  end

end
