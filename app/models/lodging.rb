class Lodging < ApplicationRecord
  # Direct associations

  belongs_to :city

  # Indirect associations

  # Validations

  validates :name, :uniqueness => { :scope => [:address] }

  validates :name, :presence => true

end
