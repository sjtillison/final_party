class Type < ApplicationRecord
  # Direct associations

  has_many   :parties,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
