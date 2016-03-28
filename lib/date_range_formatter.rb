require "date"
require "fixnum"

class DateRangeFormatter
  attr_reader :start_date, :end_date, :start_time, :end_time

  def initialize(start_date, end_date, start_time = nil, end_time = nil)
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
    @start_time = start_time
    @end_time = end_time
  end

  def to_s
    if start_date == end_date
      time_comparison(
        same_time: "#{full_start_date} at #{start_time} to #{end_time}",
        start_time: "#{full_start_date} at #{start_time}",
        end_time: "#{full_start_date} until #{end_time}",
        other: full_start_date
      )
    elsif start_date.year == end_date.year
      if start_date.month == end_date.month
        time_comparison(
          other: start_date.strftime("#{start_date.day.ordinalize} - #{end_date.day.ordinalize} %B %Y")
        )
      else
        time_comparison(
          other: start_date.strftime("#{start_date.day.ordinalize} %B - ") + full_end_date
        )
      end
    else
      time_comparison
    end
  end

  def time_comparison(options = {})
    if start_time && end_time
      options.fetch(:same_time, "#{full_start_date} at #{start_time} - #{full_end_date} at #{end_time}")
    elsif start_time
      options.fetch(:start_time, "#{full_start_date} at #{start_time} - #{full_end_date}")
    elsif end_time
      options.fetch(:end_time, "#{full_start_date} - #{full_end_date} at #{end_time}")
    else
      options.fetch(:other, "#{full_start_date} - #{full_end_date}")
    end
  end

  def full_start_date
    @_full_start_date ||= start_date.strftime("#{start_date.day.ordinalize} %B %Y")
  end

  def full_end_date
    @_full_end_date ||= end_date.strftime("#{end_date.day.ordinalize} %B %Y")
  end
end
