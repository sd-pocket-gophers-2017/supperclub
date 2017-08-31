require 'rails_helper'

RSpec.describe Event, :type => :model do
  let(:event) { Event.new }

  describe "#future_date" do
    it "returns ( :date_time, can't be in the past)" do
      event.date_time = DateTime.now
      expect(event.future_date).to eq(false)
    end
  end









end
