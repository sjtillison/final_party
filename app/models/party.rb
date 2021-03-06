class Party < ApplicationRecord
  # Direct associations

  belongs_to :lodging

  belongs_to :type

  belongs_to :city

  has_many   :attendees,
             :dependent => :destroy

  has_many   :events,
             :class_name => "PlannedEvent",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

  validates :start_date, :presence => true

end
