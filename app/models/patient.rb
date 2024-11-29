class Patient < ApplicationRecord

  belongs_to :staff_member, optional: true
  has_many :promises
  has_many :families, through: :promises

  with_options presence: true do
    validates :patient_number, uniqueness: true
    validates :patient_last_name
    validates :patient_first_name
    validates :patient_last_name_kana
    validates :patient_first_name_kana
    validates :birthday
  end

  with_options format: {with: /\A[0-9]+\z/} do
    validates :patient_number
    validates :floor
    validates :room
  end

  with_options format: { with: /\A[ァ-ヶー-]+\z/ } do
    validates :patient_last_name_kana
    validates :patient_first_name_kana
  end

end
