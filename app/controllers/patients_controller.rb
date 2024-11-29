class PatientsController < ApplicationController

  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  def index
    @patients = Patient.order(:room)
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path
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
    redirect_to patients_path
  end

  def search
    @patients = []
    sei = params[:patient_last_name_kana]
    mei = params[:patient_first_name_kana]
    if sei.present? && mei.present?
      @patients = Patient.where(sei: sei, mei: mei)
      if @patients.exists?
        redirect_to new_promise_path
      else
        flash[:alert] = '該当者が見つかりません'
        render :search, status: :unprocessable_entity
      end
    end
  end


  private

  def patient_params
    params.require(:patient).permit(:patient_number, :patient_last_name, :patient_first_name, :patient_last_name_kana, :patient_first_name_kana, :birthday, :floor, :room)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end
