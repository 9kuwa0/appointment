class Patient < ApplicationRecord

  belongs_to :staff_member, optional: true
  has_many :promises, dependent: :destroy
  has_many :families, through: :promises

  with_options presence: true do
    validates :patient_number, uniqueness: true
    validates :patient_last_name
    validates :patient_first_name
    validates :patient_last_name_kana
    validates :patient_first_name_kana
    validates :birthday
  end

  validates :patient_number, format: {with: /\A\d{6}\z/, message: "は6桁の数字で入力してください"}

  with_options format: {with: /\A[0-9]+\z/} do
    validates :floor, inclusion: {in: [3, 4, 5]}
    validates :room, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 599}
  end

  with_options format: { with: /\A[ァ-ヶー-]+\z/ } do
    validates :patient_last_name_kana
    validates :patient_first_name_kana
  end

end
