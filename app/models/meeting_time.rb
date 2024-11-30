class MeetingTime < ActiveHash::Base

  self.data = [
    { id: 1, name: "---" },
    { id: 2, name: "14:00 - 14:15", hour: 14, minute: 0},
    { id: 3, name: "14:15 - 14:30", hour: 14, minute: 15},
    { id: 4, name: "14:30 - 14:45", hour: 14, minute: 30},
    { id: 5, name: "14:45 - 15:00", hour: 14, minute: 45},
    { id: 6, name: "15:00 - 15:15", hour: 15, minute: 0},
    { id: 7, name: "15:15 - 15:30", hour: 15, minute: 15},
    { id: 8, name: "15:30 - 15:45", hour: 15, minute: 30},
    { id: 9, name: "15:45 - 16:00", hour: 15, minute: 45},
    { id: 10, name: "16:00 - 16:15", hour: 16, minute: 0},
    { id: 11, name: "16:15 - 16:30", hour: 16, minute: 15},
    { id: 12, name: "16:30 - 16:45", hour: 16, minute: 30},
    { id: 13, name: "16:45 - 17:00", hour: 16, minute: 45}
  ]

  include ActiveHash::Associations
    has_many :promises
end
