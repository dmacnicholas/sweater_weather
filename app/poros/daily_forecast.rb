class DailyForecast
#   def self.data(attributes)
#     attributes.map do |daily|
#       {
#         date: Time.at(daily[:dt]).strftime("%Y-%m-%d"),
#         sunrise: Time.at(daily[:sunrise]),
#         sunset: Time.at(daily[:sunset]),
#         max_temp: daily[:temp][:max],
#         min_temp: daily[:temp][:min],
#         conditions: daily[:weather].first[:description],
#         icon: daily[:weather].first[:icon]
#       }
#     end
#   end
# end
  attr_reader :datetime, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon, :temp

  def initialize(attributes)
    @datetime = Time.at(attributes[:dt]).strftime("%m/%d/%Y")
    @sunrise = Time.at(attributes[:sunrise]).strftime("%I:%M:%S %p")
    @sunset = Time.at(attributes[:sunset]).strftime("%I:%M:%S %p")
    @max_temp = attributes[:temp][:max]
    @min_temp = attributes[:temp][:min]
    @conditions = attributes[:weather][0][:main]
    @icon = attributes[:weather][0][:icon]
    @temp = attributes[:temp][:day]
  end
end 
