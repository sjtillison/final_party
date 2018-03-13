class Lodging < ApplicationRecord
  # Direct associations

  has_many   :parties,
             :dependent => :destroy

  belongs_to :city

  # Indirect associations

  # Validations

  validates :name, :uniqueness => { :scope => [:address] }

  validates :name, :presence => true

end
