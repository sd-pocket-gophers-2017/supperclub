class Invite < ApplicationRecord
  belongs_to :event
  belongs_to :guest

  validates :event, :guest, presence: true
end
