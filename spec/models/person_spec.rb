require 'rails_helper'

RSpec.describe Person, :type => :model do
  describe "#full_name" do
    it "has virtual attribute full name" do
      joe = Person.new(first_name: "Joe", last_name: "Bob", email: "enail@email.com", phone: "(321)321-4321")

      expect(joe.full_name).to eq("Joe Bob")
    end
  end
end
