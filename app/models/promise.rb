class Promise < ApplicationRecord
  belongs_to :family
  belongs_to :patient
  before_save :set_start_time

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :meeting_time, class_name: "MeetingTime", foreign_key: "meeting_time_id"

  with_options presence: true do
    validates :family_id
    validates :patient_id
    validates :day
    validates :meeting_time_id, numericality: { other_than: 1, message: "を選択してください" }
  end

  validate :limit_reservations_per_time_slot

  def self.status_for(day, time_string)
    meeting_time = MeetingTime.find_by(name: time_string)
    return "◯" unless meeting_time
    count = where(day: day, meeting_time_id: meeting_time.id).count

    case count
      when 0 then "○"
      when 1 then "△"
      else "×"
    end
  end

  private

  def set_start_time
    if day.present? && meeting_time.present?
      self.start_time = day.to_datetime.change(hour: meeting_time.hour, min: meeting_time.minute)
    end
  end

  def limit_reservations_per_time_slot
    return if day.blank? || meeting_time_id.blank?
    count = Promise.where(day: day, meeting_time_id: meeting_time_id)
                   .where.not(id: id)
                   .count
    if count >= 2
      errors.add(:base, "この日時の予約はすでに上限に達しています（最大2件）")
    end
  end

end
