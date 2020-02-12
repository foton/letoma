class Date
  def initialize(year, month, day)
    @utc_time = Time.utc(year, month, day)
  end

  def day
    @utc_time.day
  end

  def month
    @utc_time.month
  end

  def year
    @utc_time.year
  end

  def to_s
    @utc_time.to_s("%Y-%m-%d")
  end

  def self.parse(date_str) : Date
    utc_time = Time.parse(date_str, "%Y-%m-%d", Time::Location::UTC)
    Date.new(utc_time.year, utc_time.month, utc_time.day)
  end
end
