# methods for importing files to the database belong here
class ImportController < ApplicationController
  # Takes input file and runs job. Renders inline link to go back to page
  # Might have to switch to async perform later if input files are big
  def import
    ImportGoalSheetJob.new.perform(params[:file].path)
    render 'welcome/index'
  end
end
