require "fixnum"

class TimeFormatter
  attr_reader :start_date, :end_date, :start_time, :end_time

  def initialize(start_date, end_date, start_time, end_time)
    @start_date = start_date
    @end_date = end_date
    @start_time = start_time
    @end_time = end_time
  end

  def to_s
    if start_time && end_time
      start_and_end_time
    elsif start_time
      start_time_only
    elsif end_time
      end_time_only
    else
      other
    end
  end

  private

  def start_and_end_time
    "#{full_start_date} at #{start_time} - #{full_end_date} at #{end_time}"
  end

  def start_time_only
    "#{full_start_date} at #{start_time} - #{full_end_date}"
  end

  def end_time_only
    "#{full_start_date} - #{full_end_date} at #{end_time}"
  end

  def other
    "#{full_start_date} - #{full_end_date}"
  end

  def full_start_date
    @_full_start_date ||= start_date.strftime("#{start_date.day.ordinalize} %B %Y")
  end

  def full_end_date
    @_full_end_date ||= end_date.strftime("#{end_date.day.ordinalize} %B %Y")
  end
end
