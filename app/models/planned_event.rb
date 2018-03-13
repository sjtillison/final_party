class PlannedEvent < ApplicationRecord
  # Direct associations

  belongs_to :activity

  belongs_to :party

  # Indirect associations

  # Validations

end
