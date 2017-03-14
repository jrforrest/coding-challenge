class Company < ApplicationRecord
  validates :name, :city, :state, :description, :founded_at, presence: true
end
