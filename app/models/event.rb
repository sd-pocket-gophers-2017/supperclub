class Event < ApplicationRecord
  belongs_to :admin, class_name: "Person"
  has_many :invites
  has_many :guests, through: :invites

  validates :name, :location, :date_time, presence: true
  validate :future_date

  def future_date
    errors.add( :date_time, "can't be in the past") if date_time and date_time < DateTime.now
  end
end
