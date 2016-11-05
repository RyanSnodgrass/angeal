require 'rails_helper'

RSpec.describe ImportController do
  describe 'import file function' do
    it 'hits the import goal sheet job class' do
      allow_any_instance_of(ImportGoalSheetJob).to receive(:perform).and_return(true)
      expect_any_instance_of(ImportGoalSheetJob).to receive(:perform)
      file = fixture_file_upload('dummy_sheet.xlsx')
      post :import, file: file
      expect(response.body).to eq('Done<br><br><a href="/">Back to home</a>')
    end
  end
end
