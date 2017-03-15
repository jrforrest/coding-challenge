class Company < ApplicationRecord
  has_many :founders

  validates :name, :city, :state, :description, :founded_at, presence: true
end
