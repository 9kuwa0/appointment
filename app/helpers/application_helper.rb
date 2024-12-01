module ApplicationHelper
  def display_status(day, time)
    if family_signed_in?
      Promise.status_for(day, time)
    elsif staff_member_signed_in?
      promises = Promise.where(day: day, meeting_time_id: MeetingTime.find_by(name: time).id)
      if promises.exists?
        promises.map do |f|
           "#{f.patient.patient_last_name} #{f.patient.patient_first_name} - #{f.family.family_last_name} #{f.family.family_first_name}"
        end.join("\n")
      else
        "空き"
      end
    else
    end
  end
end