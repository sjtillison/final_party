class City < ApplicationRecord
  # Direct associations

  has_many   :activities,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

end
