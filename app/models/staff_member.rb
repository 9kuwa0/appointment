class StaffMember < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :patients
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :staff_department
  belongs_to :staff_affiliation

  with_options presence: true do
    validates :staff_number, format: { with: /\A\d{4}\z/, message: "は4桁の数字で入力してください" }
    validates :staff_last_name
    validates :staff_first_name
    validates :staff_department_id, numericality: { other_than: 1, message: "は未選択以外で入力してください" }
    validates :staff_affiliation_id, numericality: { other_than: 1, message: "は未選択以外で入力してください" }
  end
end
