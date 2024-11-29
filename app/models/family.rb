class Family < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :promises, dependent: :destroy
  has_many :patients, through: :promises

  with_options presence: true do
    validates :family_last_name
    validates :family_first_name
    validates :family_last_name_kana
    validates :family_first_name_kana
  end

  with_options format: { with: /\A[ァ-ヶー-]+\z/ } do
    validates :family_last_name_kana
    validates :family_first_name_kana
  end


end
