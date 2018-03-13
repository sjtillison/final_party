class Activity < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :cost_pp, :numericality => true

  validates :title, :presence => true

end
