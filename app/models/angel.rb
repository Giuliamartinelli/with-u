class Angel < ApplicationRecord
  belongs_to :user

  before_validation :strip_blanks

  def strip_blanks
    self.phone_number = self.phone_number.gsub(/\s+/, "")
  end

  validates :name, :phone_number, presence: true
  validates :phone_number, format: { with: /\A.{6,}\z/ }
end
