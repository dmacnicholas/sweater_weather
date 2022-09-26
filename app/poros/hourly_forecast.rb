class HourlyForecast
#   def self.data(attributes)
#     attributes.map do |hourly|
#       {
#         time: Time.at(hourly[:dt]).strftime("%H:%M:%S"),
#         temperature: hourly[:temp],
#         conditions: hourly[:weather][0][:description],
#         icon: hourly[:weather][0][:icon]
#       }
#     end
#   end
# end
  attr_reader :datetime, :time, :temp, :conditions, :icon, :date

  def initialize(attributes)
    @date = Time.at(attributes[:dt])
    @time = Time.at(attributes[:dt]).strftime("%H:%M:%S")
    @temp = attributes[:temp]
    @conditions = attributes[:weather][0][:main]
    @icon = attributes[:weather][0][:icon]
  end
end
