require 'rails_helper'

RSpec.describe ImportGoalSheetJob do
  it 'creates visions and goals' do
    expect { ImportGoalSheetJob.new.perform('spec/fixtures/dummy_sheet.xlsx') }
      .to change { Vision.count }.from(0).to(1)
      .and change { Goal.count }.from(0).to(5)
  end
  context 'creates association between goals and vision' do
    it 'goes vision to goals' do
      ImportGoalSheetJob.new.perform('spec/fixtures/dummy_sheet.xlsx')
      expect(Vision.find_by(blurb: 'End poverty').goals.count).to eq(2)
    end
    it 'goes goals to vision' do
      ImportGoalSheetJob.new.perform('spec/fixtures/dummy_sheet.xlsx')
      expect(Goal.find_by(title: 'voluptas nulla pariatur').vision.blurb)
        .to eq('End poverty')
    end
  end

  it 'creates association between goals and other goals' do
    ImportGoalSheetJob.new.perform('spec/fixtures/dummy_sheet.xlsx')
    g = Goal.find_by(title: 'voluptatem accusantium', range: 'Medium')
    expect(g.parent.title).to eq('eiusmod tempor incididunt')
    g2 = Goal.find_by(title: 'voluptas nulla pariatur', range: 'Long')
    expect(g2.children.count).to eq(2)
  end
end
