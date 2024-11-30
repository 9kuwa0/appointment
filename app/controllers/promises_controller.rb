class PromisesController < ApplicationController
  
  def index
    @promises = current_family.promises.includes(:patient)
  end

  def new
    @promises = Promise.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 1).order(day: :desc)
    @times = MeetingTime.all
    @patient = Patient.find_by(patient_last_name_kana: params[:patient_last_name_kana], patient_first_name_kana: params[:patient_first_name_kana])
    if @patient
      @promise = current_family.promises.new(patient: @patient)
    else
      flash[:alert] = "該当する患者が見つかりません"
      redirect_to search_promises_path
    end
  end

  def create
    @patient = Patient.find(params[:promise][:patient_id])
    @promise = current_family.promises.new(promise_params)
    if @promise.save
      redirect_to promises_path
    else
      logger.debug "保存失敗：#{@promise.errors.full_messages}"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @promise = Promise.find(params[:id])
  end

  def search
  end


  private

  def promise_params
    params.require(:promise).permit(:day, :meeting_time_id, :patient_id) 
  end
end
