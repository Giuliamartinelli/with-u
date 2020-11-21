class Verification < ApplicationRecord
  attr_accessor :verified
  belongs_to :user
end
