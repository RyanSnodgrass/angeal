# Goals for all ranges of goals['Long', 'Medium', 'Short']
class Goal < ApplicationRecord
  belongs_to :vision
  has_many :children, class_name: 'Goal', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Goal'
end
