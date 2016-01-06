class Moment
	VERSION = "1.0.0"
end

class DateTime
  def self.from_language(str)
  	d = Moment.new().parse_date_time_string(str)
    return DateTime.strptime("#{d}", "%s")
  end
end
require 'moment/moment'