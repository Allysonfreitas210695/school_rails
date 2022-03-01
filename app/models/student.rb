class Student < ApplicationRecord
  belongs_to :discipline
  has_one_attached :avatar
  validates :name, :registration,  presence: true
end
