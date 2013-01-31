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
      cal = Google::Calendar.new(
        :username => @@username,
        :password => @@password
      )
      #:app_name => 'mycompany.com-googlecalendar-integration'

      #event = cal.create_event do |e|
      #  e.title = 'A Cool Event'
      #  e.start_time = Time.now
      #  e.end_time = Time.now + (60 * 60) # seconds * min
      #end
      #
      #puts event
      #
      #event = cal.find_or_create_event_by_id(event.id) do |e|
      #  e.title = 'An Updated Cool Event'
      #  e.end_time = Time.now + (60 * 60 * 2) # seconds * min * hours
      #end
      #
      #puts event

      puts cal.events
    end
  end
end