# methods for importing files to the database belong here
class ImportController < ApplicationController
  def import
    ImportGoalSheetJob.new.perform(params[:file].path)
    render inline: "Done<br><br><a href=\"/\">Back to home</a>"
  end
end
