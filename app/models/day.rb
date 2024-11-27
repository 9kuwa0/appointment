class TimeSlot < ActiveHash::Base

  self.data = [
    { id: 1, name: "14:00" },
    { id: 2, name: "14:15" },
    { id: 3, name: "14:30" },
    { id: 4, name: "14:45" },
    { id: 5, name: "15:00" },
    { id: 6, name: "15:15" },
    { id: 7, name: "15:30" },
    { id: 8, name: "15:45" },
    { id: 9, name: "16:00" },
    { id: 10, name: "16:15" },
    { id: 11, name: "16:30" },
    { id: 12, name: "16:45" },
    { id: 13, name: "17:00" }
  ]

  include ActiveHash::Associations
    has_many :promises
end
