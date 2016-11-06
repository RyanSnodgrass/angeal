# methods for the general use of the app
class StrategicPlanController < ApplicationController
  def index
    @vision = Vision.first
    # @goals = Goal.all
  end
end
