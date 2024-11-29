class Promise < ApplicationRecord
  belongs_to :family
  belongs_to :staff_member
  belongs_to :promise
  belongs_to :patient

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :meeting_time, class_name: "MeetingTime", foreign_key: "meeting_time_id"

  with_options presence: true do
    validates :family_id
    validates :patient_id
    validates :day
    validates :meeting_time_id, numericality: { other_than: 1 }
  end

  def self.status_for(day, time_string)
    meeting_time = MeetingTime.find_by(name: time_string)
    return "◯" unless meeting_time
    count = where(day: day, meeting_time_id: meeting_time.id).count

    case count
    when 0
      "○"
    when 1
      "△"
    else
      "×"
    end
  end
end
