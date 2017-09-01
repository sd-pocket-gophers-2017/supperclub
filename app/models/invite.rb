class Invite < ApplicationRecord
  belongs_to :event
  belongs_to :guest

  validates :event, :guest, presence: true

  scope :open, -> {where(accepted: nil)}
  scope :accepted, -> {where(accepted: true)}
  scope :rejected, -> {where(accepted: false)}
  scope :in_two_days, -> {joins(:event).merge(Event.in_two_days)}
end
