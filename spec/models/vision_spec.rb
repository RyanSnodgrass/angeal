require 'rails_helper'

RSpec.describe Vision, type: :model do
  it 'has a one to many relationship with goals' do
    v = Vision.create(blurb: 'b')
    g = Goal.create(title: 'g')
    v.goals << g
    expect(v.goals).to include(g)
    expect(g.vision).to eq(v)
  end
end
