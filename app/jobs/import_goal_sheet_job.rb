# Takes excel file and creates Vision and Goals
class ImportGoalSheetJob
  # main method that runs the job
  def perform(input_file)
    @xlsx = Roo::Excelx.new(input_file)
    vision_sheet_input
    goal_sheet_input
  end

  private

  # Creates sheet object then creates vision
  def vision_sheet_input
    @vision_sheet = @xlsx.sheet('Vision').parse(header_search: [])
    @vision_sheet.drop(1).each do |row|
      @vision = Vision.create!(blurb: row['blurb'])
    end
  end

  def goal_ranges
    %w(Long Medium Short)
  end

  # runs through each sheet creating a sheet object, then creates goals
  def goal_sheet_input
    goal_ranges.each do |range|
      @range = range
      @goal_sheet = @xlsx.sheet(@range).parse(header_search: [])
      create_goals
    end
  end

  # iterates through sheet, creates current goal, then ties parent-child
  def create_goals
    @goal_sheet.drop(1).each do |row|
      @row = row
      create_goal
      next vision_to_goals if @range == 'Long'
      goals_to_goals
    end
  end

  # Creates current goal when iterating through sheet
  def create_goal
    @current_goal_in_row = Goal.create!(title: @row['title'],
                                        what: @row['what'],
                                        who: @row['who'],
                                        when: @row['when'],
                                        range: @range)
  end

  def vision_to_goals
    @vision.goals << @current_goal_in_row
  end

  # finds previously created goal as the parent, then ties the current as child
  def goals_to_goals
    @higher_goal = Goal.find_by(title: @row['Higher_goal_title'])
    @higher_goal.children << @current_goal_in_row
  end
end
