require 'ri_cal'

module Ical2google
  class Parser
    TODO_KEYS = [
      :categories, :created, :dtstamp, :due, :last_modified, :organizer,
      :percent_complete, :priority, :sequence, :summary,
      :finish_time, :start_time
    ]
    EVENT_KEYS = [
      :uid, :dtstart, :dtend, :attendee, :categories, :created, :description,
      :dtstamp, :last_modified, :location, :organizer, :sequence, :status, :summary,
      :transp
    ]

    def initialize(file)
      calendars = RiCal.parse(open(file))
      data = calendars.collect { |c| filter_calendar(c) }

      calendars.save

      puts data.to_yaml

      # https://github.com/wtnabe/ical2gcal/blob/master/lib/ics/events.rb
    end

    def filter_calendar_sub_object(obj, keys)
      h = Hash.new
      keys.each do |k|
        begin
          h[k] = obj.send(k)
        rescue => e
          puts "*** #{k}"
          raise e
        end
      end
      return h
    end

    def filter_calendar(c)
      h = Hash.new
      h[:todos] = c.todos.collect { |t| filter_calendar_sub_object(t, TODO_KEYS) }
      h[:events] = c.events.collect { |t| filter_calendar_sub_object(t, EVENT_KEYS) }

      return h
    end

  end
end