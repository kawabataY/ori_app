class Frequency < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '毎日' },
    { id: 3, name: '毎週' },
    { id: 4, name: '毎月' }
  ]

  include ActiveHash::Associations
  has_many :tasks
end
