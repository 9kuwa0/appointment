class PatientsController < ApplicationController

  before_action :set_patient, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to patient_path(@patient.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient.destroy
    redirect_to staff_member_index_path
  end

  private

  def patient_params
    params.require(:patient).permit(:patient_number, :patient_last_name, :patient_first_name, :patient_last_name_kana, :patient_first_name_kana, :birthday, :floor, :room)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end
