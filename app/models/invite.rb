class Invite < ApplicationRecord
  belongs_to :event
  belongs_to :guest

  validates :event, :guest, presence: true

  scope :open, -> {where(accepted: nil)}
  scope :accepted, -> {where(accepted: true)}
  scope :rejected, -> {where(accepted: false)}

  scope :in_two_days, -> {where((Datetime.now.beginning_of_day + 2.days)..(Datetime.now.end_of_day + 2.days))}
end
