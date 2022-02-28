class Student < ApplicationRecord
  validates :name, :registration,  presence: true
end
