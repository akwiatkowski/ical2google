require 'google_calendar'
require 'open-uri'

module Ical2google
  class Googler

    def self.username=(_username)
      @@username = _username
    end

    def self.password=(_password)
      @@password = _password
    end

    def initialize
      #https://github.com/northworld/google_calendar/blob/master/lib/google/event.rb

      @calendar = Google::Calendar.new(
        :username => @@username,
        :password => @@password
      )
      #:app_name => 'mycompany.com-googlecalendar-integration'
    end

    def clear!
      result = @calendar.events

      if result.kind_of?(Array)
        result.each do |event|
          @calendar.delete_event(event)
        end
      elsif not result.nil?
        @calendar.delete_event(result)
      end
    end

    def import_event(params, id)
      ## find by name
      #title = URI::encode(params[:title])
      #query = "?title=#{title}"
      #result = @calendar.find_events(query)

      event = @calendar.create_event do |e|
        e.title = params[:title]
        e.where = params[:location] if params[:location]
        e.start_time = params[:start_time].to_s if params[:start_time]
        e.end_time = params[:end_time].to_s if params[:end_time]
        e.content = params[:content] if params[:content]
        # e.all_day # TODO
      end
    end

  end
end