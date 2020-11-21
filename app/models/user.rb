require "verification_code"

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :angels, dependent: :destroy
  has_many :maps

  has_one_attached :photo

  validates :name, :phone_number, presence: true
  validates :phone_number, uniqueness: true, format: { with: /\A.{6,}\z/ }
  validates :email, format: { with: /\A\S+@[a-z]{2,}\.[a-z]{2,}\z/ }, uniqueness: true

  def code
    p VerificationCode.create_code(self.id) # return {time: time, code: some_code, user_id: id}
  end

  def verify(try_code)
    boolean = VerificationCode.verify_code(try_code, code, self.id)
    if boolean
      verified(true)
    else
      verified(false)
    end
  end

  def verified(boolean = false)
    return boolean
  end

end

