class StaffDepartment < ActiveHash::Base

  self.data = [
    { id: 1, name: "未選択"},
    { id: 2, name: "医局"},
    { id: 3, name: "看護部"},
    { id: 4, name: "事務局"},
    { id: 5, name: "臨床検査部"},
    { id: 6, name: "診療放射線科"},
    { id: 7, name: "リハビリテーション科"},
    { id: 8, name: "栄養科"},
    { id: 9, name: "薬局"},
    { id: 10, name: "管理者"},
    { id: 11, name: "その他"}
  ]

  include ActiveHash::Associations
    has_many :staff_members

end