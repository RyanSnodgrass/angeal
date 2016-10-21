require 'rails_helper'

RSpec.describe ImportGoalSheetJob do
  it 'creates visions and goals' do
    expect { ImportGoalSheetJob.new.perform('spec/fixtures/dummy_sheet.xlsx') }
      .to change { Vision.count }.from(0).to(1)
      .and change { Goal.count }.from(0).to(5)
  end
  xit 'creates association between goals and vision' do
    ImportGoalSheetJob.new.perform('spec/fixtures/dummy_sheet.xlsx')
    expect(Vision.find_by(blurb: 'End poverty').goals.count).to eq(2)
  end
end
