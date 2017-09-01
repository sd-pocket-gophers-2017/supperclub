class Admin < Person
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  has_many :sent_invites, through: :events, source: :invites
  has_many :guests, through: :sent_invites
end
