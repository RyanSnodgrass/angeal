# Goals for all ranges of goals['Long', 'Medium', 'Short']
class Goal < ApplicationRecord
  belongs_to :vision
  has_many :children_goals, class_name: 'Goal', foreign_key: 'parent_goal_id'
  belongs_to :parent_goal, class_name: 'Goal'
end
