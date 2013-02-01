require 'ri_cal'

module Ical2google
  class Synchronizer
    def initialize(file, google_credentials)
      Ical2google::Googler.username = google_credentials['username']
      Ical2google::Googler.password = google_credentials['password']
      @googler = Ical2google::Googler.new
      @parser = Ical2google::Parser.new(file)

      # TODO too brutal
      @googler.clear!

      # import from ics file to google
      @parser.data[:events].each do |event|
        h = Hash.new
        h[:title] = event[:summary]
        h[:start_time] = event[:dtstart]
        h[:end_time] = event[:dtend]
        h[:content] = event[:description]

        @googler.import_event(h, event[:uid])
        puts "Added #{event[:uid]} - #{event[:summary]}"
      end

    end
  end
end