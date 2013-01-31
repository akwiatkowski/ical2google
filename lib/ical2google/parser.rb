require 'ri_cal'

module Ical2google
  class Parser
    TODO_KEYS = [
      :categories, :due, :organizer, :summary, :priority, :percent_complete,
      :last_modified, :finish_time, :start_time, :last_modified,
      :dtstamp, :created
    ]
    EVENT_KEYS = [
    ]

    def initialize(file)
      calendars = RiCal.parse(open(file))
      data = calendars.collect { |c| filter_calendar(c) }

      puts data.to_yaml

      # https://github.com/wtnabe/ical2gcal/blob/master/lib/ics/events.rb
    end

    def filter_calendar_sub_object(obj, keys)
      h = Hash.new
      keys.each do |k|
        begin
          h[k] = obj.send(k)
        rescue
        end
      end
      return h
    end

    def filter_calendar(c)
      # todos
      todos = c.todos.collect { |t| filter_calendar_sub_object(t, TODO_KEYS) }

      # c.events
      # c.todos


      # RiCal::Component::Todo

      #puts @calendars.first.events.to_yaml
      #@calendars.inspect


      puts todos.inspect

      return nil
    end

  end
end