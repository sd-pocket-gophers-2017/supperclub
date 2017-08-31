require 'rails_helper'

RSpec.describe Person, :type => :model do
  describe "#full_name" do
    it "has virtual attribute full name" do
      joe = Person.create!(first_name: "Joe", last_name: "Bob")

      expect(joe.full_name).to eq("Joe Bob")
    end
  end
end
