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

  def to_time
    @utc_time
  end

  def self.parse(date_str) : Date
    utc_time = Time.parse(date_str, "%Y-%m-%d", Time::Location::UTC)
    Date.new(utc_time.year, utc_time.month, utc_time.day)
  end

  def self.today
    local_time = Time.local # bettere with zone
    Date.new(local_time.year, local_time.month, local_time.day)
    # Time.local(2016, 2, 15, 10, 20, 30, location: Time::Location.load("Europe/Berlin"))
  end
end
