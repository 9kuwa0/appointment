class PromisesController < ApplicationController
  
  def index
    @patients = Patient.all

  end

  def new
    @patient = Patient.find_by(patient_last_name_kana: params[:patient_last_name_kana], patient_first_name_kana: params[:patient_first_name_kana])
    if @patient
      @promise = current_family.promises.new(patient: @patient)
    else
      flash[:alert] = "該当する患者が見つかりません"
      redirect_to search_promises_path
    end
  end

  def create
    @promise = current_family.promise.new(promise_params)
    if @promise.save
      redirect_to family_index_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def search
  end


  private

  def promise_params
    # params.require(:promise).permit(:day, :time).merge(family_id: current_family.id, patient_id: @patient.id)
    params.require(:promise).permit(:day, :meeting_time, :family_id, :patient_id) 
  end
end
