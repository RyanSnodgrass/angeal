# Active record class that defines the behavior of Visions
class Vision < ApplicationRecord
  has_many :goals
end
