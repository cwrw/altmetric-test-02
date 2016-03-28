class SameYearFormatter < TimeFormatter
  private

  def other
    start_date.strftime("#{start_date.day.ordinalize} %B - ") + full_end_date
  end
end
