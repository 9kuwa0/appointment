class Patient < ApplicationRecord

  belongs_to :staff_member

  with_options presence: true do
    validates :ptient_number
    validates :ptient_last_name
    validates :ptient_first_name
    validates :ptient_last_name_kana, format: { with: /\A[ァ-ヶー-]+\z/}
    validates :ptient_first_name_kana, format: { with: /\A[ァ-ヶー-]+\z/}
    validates :birthday
  end
end
