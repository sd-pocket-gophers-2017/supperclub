require 'rails_helper'

describe Person do
  describe "#full_name" do
    it "has virtual attribute full name" do
      person = Person.new
      person.first_name = "Mark"
      person.last_name = "Kim"
      expect(person.full_name).to eq("Mark Kim")
    end
  end
end
