class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :angels, dependent: :destroy
  has_many :maps

  has_one_attached :photo

  before_validation :strip_blanks

def strip_blanks
self.phone_number = self.phone_number.gsub(/\s+/, "")
end

  validates :name, :phone_number, presence: true
  validates :phone_number, uniqueness: true, format: { with: /\A.{6,}\z/ }
  validates :email, format: { with: /\A\S+@[a-z]{2,}\.[a-z]{2,}\z/ }, uniqueness: true

end
