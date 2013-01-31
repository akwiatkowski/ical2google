require 'ri_cal'

module Ical2google
  class Parser
    def initialize(file)
      @calendars = RiCal.parse(open(file))

      puts @calendars.to_yaml
      #@calendars.inspect
    end
  end
end