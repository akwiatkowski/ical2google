require 'google_calendar'

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

    def import_event(params, id = Time.now.to_f.to_s + rand(2).to_s)
      event = @calendar.find_or_create_event_by_id(id) do |e|
        e.title = params[:title]
        e.start_time = params[:start_time] if params[:start_time]
        e.end_time = params[:end_time] if params[:end_time]
        e.content = params[:content] if params[:content]
      end
    end

  end
end