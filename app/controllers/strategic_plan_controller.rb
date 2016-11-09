# methods for the general use of the app
class StrategicPlanController < ApplicationController
  def index
    @vision = Vision.first
    # @goals = Goal.all
  end

  # Deletes all Visions and Goals, then redirects back to root. Meant as restart
  def delete
    Vision.destroy_all
    Goal.destroy_all
    render 'welcome/index'
  end
end
