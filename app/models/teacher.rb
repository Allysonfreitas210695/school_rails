class Teacher < ApplicationRecord
  belongs_to :discipline
  validates :name, :registration, presence: true
end
