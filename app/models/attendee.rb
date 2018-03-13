class Attendee < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :party

  # Indirect associations

  # Validations

end
