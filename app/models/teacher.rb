class Teacher < ApplicationRecord
  has_many :students
  validates :name, :registration, :department, :discipline, presence: true
end
