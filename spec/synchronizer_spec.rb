# encoding: utf-8

require 'spec_helper'

describe Ical2google::Synchronizer do
  it "should load ics file" do
    cal_file = File.join("spec", "fixtures", "std.ics")
    gog_file = File.join("spec", "fixtures", "google_credentials.yml")
    credentials = YAML::load(File.open(gog_file))

    s = Ical2google::Synchronizer.new(cal_file, credentials)
  end
end