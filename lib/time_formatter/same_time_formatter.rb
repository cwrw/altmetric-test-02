class SameTimeFormatter < TimeFormatter
  private

  def start_and_end_time
    "#{full_start_date} at #{start_time} to #{end_time}"
  end

  def start_time_only
    "#{full_start_date} at #{start_time}"
  end

  def end_time_only
    "#{full_start_date} until #{end_time}"
  end

  def other
    full_start_date
  end
end
