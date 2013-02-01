# encoding: utf-8

require 'spec_helper'
require 'yaml'

describe Ical2google::Googler do
  it "should load ics file" do
    f = File.join("spec", "fixtures", "google_credentials.yml")
    c = YAML::load(File.open(f))

    Ical2google::Googler.username = c['username']
    Ical2google::Googler.password = c['password']
    i = Ical2google::Googler.new
  end
end