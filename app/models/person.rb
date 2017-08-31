class Person < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :phone, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
