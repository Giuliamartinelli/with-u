class Angel < ApplicationRecord
  belongs_to :user

  validates :name, :phone_number, presence: true
  validates :phone_number, format: { with: /\A\+\d{6,}z/ }
end
