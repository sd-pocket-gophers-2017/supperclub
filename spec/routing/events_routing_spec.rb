require "rails_helper"

RSpec.describe "Routing to events#index", :type => :routing do
  it "routes GET /events#index to events#index#index" do
    expect(:get => "/events#index").to route_to("events#index#index")
  end

  it "routes GET /events/new to events#new" do
    expect(:get => "/events/new").to route_to("events#new")
  end

  it "routes GET /events/1 to events#show" do
    expect(:get => "/events/1").to route_to("events#show", :id => "1")
  end

  it "routes POST /events#index to events#create" do
    expect(:post => "/events#index").to route_to("events#create")
  end

  it "routes DELETE /events/1 to events#destroy" do
    expect(:delete => "/events/1").to route_to("events#destroy", :id => "1")
  end
end
