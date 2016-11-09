require 'rails_helper'

RSpec.describe StrategicPlanController do
  describe 'index' do
    it 'gets the index action' do
      get :index
      # expect
    end
  end

  describe 'delete' do
    it 'deletes all visions and goals, then redirects to home page' do
      Vision.create
      2.times { Goal.create }
      delete :delete
      expect(Goal.count).to eq(0)
      expect(Vision.count).to eq(0)
      # expect(subject).to render_template('welcome/index')
    end
  end
end
