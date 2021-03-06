# methods for the general use of the app
class StrategicPlanController < ApplicationController
  def index; end

  # Renders json for tree specifc to Treant format. Uses jbuilder file
  def tree
    @vision = Vision.first
  end

  # Deletes all Visions and Goals, then redirects back to root. Meant as restart
  def delete
    Vision.destroy_all
    Goal.destroy_all
    render 'welcome/index'
  end
end
