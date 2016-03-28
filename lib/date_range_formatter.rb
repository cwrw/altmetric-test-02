require "date"
require "time_formatter"
require "time_formatter/same_month_formatter"
require "time_formatter/same_time_formatter"
require "time_formatter/same_year_formatter"

class DateRangeFormatter
  attr_reader :start_date, :end_date, :start_time, :end_time

  def initialize(start_date, end_date, start_time = nil, end_time = nil)
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
    @start_time = start_time
    @end_time = end_time
  end

  def to_s
    formatter.new(start_date, end_date, start_time, end_time).to_s
  end

  private

  def formatter
    if start_date == end_date
      SameTimeFormatter
    elsif start_date.year == end_date.year
      if start_date.month == end_date.month
        SameMonthFormatter
      else
        SameYearFormatter
      end
    else
      TimeFormatter
    end
  end
end
