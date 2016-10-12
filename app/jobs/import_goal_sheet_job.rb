# Takes excel file and creates Vision and Goals
class ImportGoalSheetJob
  def perform(input_file)
    @xlsx = Roo::Excelx.new(input_file)
    vision_sheet_input
    goal_sheet_input
  end

  def vision_sheet_input
    @vision_sheet = @xlsx.sheet('Vision')
    @vision_sheet.each(blurb: 'blurb') do |hash|
      next if hash[:blurb] == 'blurb'
      Vision.create(blurb: hash[:blurb])
    end
  end

  def goal_ranges
    %w(Long Medium Short)
  end

  def goal_sheet_input
    goal_ranges.each do |range|
      @goal_sheet = @xlsx.sheet(range)
      @goal_sheet.each(t: 'title', wha: 'what', who: 'who', whe: 'when') do |w|
        next if w[:t] == 'title'
        Goal.create(title: w[:t],
                         what: w[:wha],
                         who: w[:who],
                         when: w[:whe],
                         range: range)
      end
    end
  end
end
