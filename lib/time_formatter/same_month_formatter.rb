class SameMonthFormatter < TimeFormatter
  private

  def other
    start_date.strftime("#{start_date.day.ordinalize} - #{end_date.day.ordinalize} %B %Y")
  end
end
