require "spec_helper"

describe TwelveHourTime do

  before(:each) do
    ActiveRecord::Base.default_timezone = :utc
    build_model :calendar_events do
      datetime :start_date
      datetime :end_date
    end
  end

  context "ActiveRecord integration" do
    # This is an example of what the input looks like if you have a form like this:
    #   datetime_select(:calendar_event, :start_date, :order => [:hour, :minute, :month, :day, :year], :twelve_hour => true)
    #   datetime_select(:calendar_event, :end_date,   :order => [:hour, :minute, :month, :day, :year], :twelve_hour => true)
    # and the user chooses Nov 14, 2011 9:00 AM to Nov 14, 2011 5:00 PM
    let(:new_event) { CalendarEvent.new("start_date(2i)" => "11", "start_date(3i)" => "14", "start_date(1i)" => "2011", "start_date(4i)" => "09", "start_date(5i)" => "00", "start_date(7i)" => "-1", "end_date(2i)" => "11", "end_date(3i)" => "14", "end_date(1i)" => "2011", "end_date(4i)" => "05", "end_date(5i)" => "00", "end_date(7i)" => "-2") }
    it "should add 12 hours to the time when PM is set" do
      new_event.start_date.to_s.should == "2011-11-14 09:00:00 UTC"
      new_event.end_date.to_s.should == "2011-11-14 17:00:00 UTC"
      (new_event.end_date - new_event.start_date).should == 8.hours # 9AM to 5PM
    end

  end

end
