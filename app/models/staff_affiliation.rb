class StaffAffiliation < ActiveHash::Base

  self.data = [
    { id: 1, name: "未選択"},
    { id: 2, name: "医局"},
    { id: 3, name: "外来"},
    { id: 4, name: "手術室"},
    { id: 5, name: "透析"},
    { id: 6, name: "3F"},
    { id: 7, name: "4F"},
    { id: 8, name: "5F"},
    { id: 9, name: "6F"},
    { id: 10, name: "総務課"},
    { id: 11, name: "医事課"},
    { id: 12, name: "臨床検査部"},
    { id: 13, name: "診療放射線科"},
    { id: 14, name: "リハビリテーション科"},
    { id: 15, name: "栄養科"},
    { id: 16, name: "薬局"},
    { id: 17, name: "その他"}
  ]

  include ActiveHash::Associations
    has_many :staff_members

end