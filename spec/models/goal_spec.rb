require 'rails_helper'

RSpec.describe Goal, type: :model do
  it 'has a one to many relationship with vision' do
    v = Vision.create(blurb: 'b')
    g = Goal.create(title: 'g')
    g.vision = v
    expect(g.vision).to eq(v)
    # expect(v.goals).to include(g)
  end
end
