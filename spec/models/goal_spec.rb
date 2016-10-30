require 'rails_helper'

RSpec.describe Goal, type: :model do
  it 'has a one to many relationship with vision' do
    v = Vision.create(blurb: 'b')
    g = Goal.create(title: 'g')
    g.vision = v
    expect(g.vision).to eq(v)
    # expect(v.goals).to include(g)
  end

  it 'has a many to many relationship with other goals' do
    g = Goal.create(title: 'g')
    g2 = Goal.create(title: 'g2')
    g3 = Goal.create(title: 'g3')
    g.children << g2
    g2.children << g3
    goal2 = Goal.find_by(title: 'g2')
    expect(goal2.title).to eq('g2')
    expect(goal2.parent.title).to eq('g')
    goal = Goal.find_by(title: 'g')
    expect(goal.children.first.title).to eq('g2')
  end
end
