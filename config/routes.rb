Rails.application.routes.draw do
  root 'welcome#index'
  post 'import/import' => 'import#import'
  get 'strategic_plan/index' => 'strategic_plan#index'
  delete 'strategic_plan/delete' => 'strategic_plan#delete'
  get 'strategic_plan/tree' => 'strategic_plan#tree'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
