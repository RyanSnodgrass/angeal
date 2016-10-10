class ImportGoalSheetJob
  def perform(input_file)
    @xlsx = Roo::Excelx.new(input_file)
    vision_sheet

  end

  def vision_sheet
    @vision_sheet = @xlsx.sheet('Vision')
    @vision_sheet.each(blurb: 'blurb') do |hash|
      next if hash[:blurb] == 'blurb'
      Vision.create(blurb: hash[:blurb])
    end
  end
end
