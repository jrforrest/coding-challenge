class Founder < ApplicationRecord
  validates :full_name, :position, presence: true
  belongs_to :company
end
