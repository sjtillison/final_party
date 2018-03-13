class City < ApplicationRecord
  # Direct associations

  has_many   :lodgings,
             :dependent => :destroy

  has_many   :parties,
             :dependent => :destroy

  has_many   :activities,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

end
