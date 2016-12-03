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

  describe 'GET tree' do
    render_views
    expectation = {
      'chart' => {
        'container' => '#tree-simple'
      },
      'nodeStructure' => {
        'text' => {
          'name' => 'v'
        },
        'children' => [
          {
            'text' => {
              'name' => 'gl'
            },
            'children' => [
              {
                'text' => {
                  'name' => 'gm2'
                },
                'children' => [
                  {
                    'text' => {
                      'name' => 'gs4'
                    }
                  }
                ]
              },
              {
                'pseudo' => true,
                'children' => [
                  {
                    'text' => {
                      'name' => 'gs2'
                    }
                  }
                ]
              }
            ]
          },
          {
            'text' => {
              'name' => 'gl2'
            },
            'children' => [

            ]
          },
          {
            'pseudo' => true,
            'children' => [
              {
                'text' => {
                  'name' => 'gm'
                },
                'children' => [
                  {
                    'text' => {
                      'name' => 'gs'
                    }
                  }
                ]
              }
            ]
          },
          {
            'pseudo' => true,
            'children' => [
              {
                'psuedo' => true,
                'children' => [
                  {
                    'text' => {
                      'name' => 'gs3'
                    }
                  }
                ]
              }
            ]
          }
        ]
      }
    }
    #           v
    #         /  | \  \
    #       gl  gl2 |  |
    #      /   \    |  |
    #     gm2   |   gm |
    #     |     |   |  |
    #    gs4   gs2  gs gs3
    it 'renders json as a specific template for trean.js' do
      v = Vision.create(blurb: 'v')
      gl = Goal.create(range: 'Long', title: 'gl')
      gl2 = Goal.create(range: 'Long', title: 'gl2')
      gm = Goal.create(range: 'Medium', title: 'gm')
      gm2 = Goal.create(range: 'Medium', title: 'gm2')
      gs = Goal.create(range: 'Short', title: 'gs')
      gs2 = Goal.create(range: 'Short', title: 'gs2')
      gs3 = Goal.create(range: 'Short', title: 'gs3')
      gs4 = Goal.create(range: 'Short', title: 'gs4')
      v.goals = [gl, gl2, gm]
      v.goals << gs3
      gl.children = [gm2]
      gl.children << gs2
      gm.children << gs
      gm2.children << gs4
      get :tree, format: :json
      expect(JSON.parse(response.body)).to eq(expectation)
    end
  end
end
