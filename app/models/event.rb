class Event < ApplicationRecord
  belongs_to :admin
  has_many :invites
  has_many :guests, through: :invites

  has_secure_token
  validates :name, :location, :date_time, presence: true
  # validate :future_date
  scope :in_two_days, -> {where(date_time: (DateTime.now.beginning_of_day + 2.days)..(DateTime.now.end_of_day + 2.days))}
  scope :closed, -> {where("date_time < ?", [DateTime.now])}
  scope :most_recent, -> {closed.order(:date_time).last}

  def future_date
    errors.add( :date_time, "can't be in the past") if date_time && date_time < DateTime.now
  end
end
