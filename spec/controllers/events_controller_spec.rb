require 'rails_helper'

describe AdminsController do
  let!(:admin) { admin.create!(first_name: "Jim", last_name: "Bob", phone: "(121)121-1212") }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "assigns the recent admins as @admins" do
      get :index
      expect(assigns(:admins)).to eq([admin])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

    describe "GET #show" do
    it "responds with status code 200" do
      get :show, params: { id: admin.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct admin as @admin" do
      get :show, params: { id: admin.id }
      expect(assigns(:admin)).to eq(admin)
    end

    it "renders the :show template" do
      get :show, params: { id: admin.id }
      expect(response).to render_template(:show)
    end
  end

