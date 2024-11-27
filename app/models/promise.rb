class Promise < ApplicationRecord
  belongs_to family
  belongs_to staff_member

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :day

  with_options presence: true do
    validates :family_id
    validates :patient_id
    validates :day
    validates :time,  numericality: { other_than: 1 }
  end
end
