class PatientsController < ApplicationController

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to staff_member_index_path, notice: "登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  private

  def patient_params
    params.require(:patient).permit(:patient_number, :patient_last_name, :patient_first_name, :patient_last_name_kana, :patient_first_name_kana, :birthday, :floor, :room)
  end
end
