class Party < ApplicationRecord
  # Direct associations

  has_many   :events,
             :class_name => "PlannedEvent",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

  validates :start_date, :presence => true

end
