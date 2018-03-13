class Activity < ApplicationRecord
  # Direct associations

  belongs_to :city

  # Indirect associations

  # Validations

  validates :cost_pp, :numericality => true

  validates :title, :presence => true

end
