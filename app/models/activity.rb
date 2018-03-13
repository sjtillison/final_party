class Activity < ApplicationRecord
  # Direct associations

  has_many   :planned_events,
             :dependent => :destroy

  belongs_to :city

  # Indirect associations

  # Validations

  validates :cost_pp, :numericality => true

  validates :title, :presence => true

end
