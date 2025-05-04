class PromisesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_promise, only:[:show, :edit, :update, :destroy]
  
  def index
    @promises = current_family.promises.includes(:patient).where("day >= ?", Date.today).order(day: :ASC, meeting_time_id: :ASC)
  end

  def new
    @promises = Promise.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 1).order(day: :desc)
    @times = MeetingTime.all
    @patient = Patient.find_by(patient_last_name_kana: params[:patient_last_name_kana], patient_first_name_kana: params[:patient_first_name_kana])
    if @patient
      @promise = current_family.promises.new(patient: @patient)
    else
      flash[:alert] = "そんな人いません！！！"
      render search_promises_path
    end
  end

  def create
    @patient = Patient.find(params[:promise][:patient_id])
    @promise = current_family.promises.new(promise_params)
    if @promise.save
      redirect_to promises_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @promise.update(promise_params)
      redirect_to promise_path(@promise.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @promise.destroy
    redirect_to promises_path
  end

  def search
  end


  private

  def authenticate_user!
    if staff_member_signed_in?
      redirect_to patients_path
    elsif !family_signed_in?
      redirect_to root_path
    end
  end

  def promise_params
    params.require(:promise).permit(:day, :meeting_time_id, :patient_id) 
  end

  def set_promise
    @promise = Promise.find(params[:id])
  end
end
