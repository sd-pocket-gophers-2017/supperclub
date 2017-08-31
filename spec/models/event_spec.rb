require 'rails_helper'

RSpec.describe Event, :type => :model do
  let(:event) { Event.new }

  describe "#future_date" do
    it "returns event start time can't be in the past, if the start time is now" do
      event.date_time = DateTime.now
      expect(event.future_date).to eq(["can't be in the past"])
    end

    it "returns true" do
      event.date_time = DateTime.tomorrow
      expect(event.future_date).to eq(nil)
    end
  end









end
