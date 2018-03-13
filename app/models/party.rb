class Party < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

  validates :start_date, :presence => true

end
