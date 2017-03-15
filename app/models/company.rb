class Company < ApplicationRecord
  has_many :founders
  has_and_belongs_to_many :tags

  validates :name, :city, :state, :description, :founded_at, presence: true
end
