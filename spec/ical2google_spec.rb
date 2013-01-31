# encoding: utf-8

require 'spec_helper'

describe Ical2google do
  it "should load ics file" do
    f = "/home/olek/pliki/dokumenty/organizer/kalendarz.ics"
    i = Ical2google::Parser.new(f)
  end
end