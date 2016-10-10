require 'rails_helper'

RSpec.describe ImportGoalSheetJob do
  it 'imports excel sheet' do
    expect(Vision.count).to eq(0)
    xlsx = Roo::Excelx.new('spec/fixtures/dummy_sheet.xlsx')
    vision_sheet = xlsx.sheet('Vision')
    vision_sheet.each(blurb: 'blurb') do |hash|
      next if hash[:blurb] == 'blurb'
      Vision.create(blurb: hash[:blurb])
    end
    expect(Vision.count).to eq(1)
  end
  it ''
end
