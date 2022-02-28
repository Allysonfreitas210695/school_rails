class Student < ApplicationRecord
  belongs_to :teacher
  validates :name, :registration, :teacher,  presence: true
end
