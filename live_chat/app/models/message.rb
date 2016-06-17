class Message < ApplicationRecord
  belongs_to :chatroom

  validates :body, presence: true
  validates :username, presence: true
end
