require 'rails_helper'

describe EventsController do
  let!(:admin) {Admin.create!(email: "email@mail.com", last_name: "David", first_name: "Larry", phone: "(111)-121-1122", password: "password", password_confirmation: "password")}
  let!(:event) { Event.create!(name: "Supper Party", date_time: DateTime.tomorrow, location: "2535 CAPITOL OAKS DRIVE", admin_id: admin.id) }
  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "assigns the recent events as @events" do
      get :index
      expect(assigns(:events)).to eq([event])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, params: { id: event.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct event as @event" do
      get :show, params: { id: event.id }
      expect(assigns(:event)).to eq(event)
    end

    it "renders the :show template" do
      get :show, params: { id: event.id }
      expect(response).to render_template(:show)
    end
  end
end
