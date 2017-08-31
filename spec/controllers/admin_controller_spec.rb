require 'rails_helper'

RSpec.describe AdminController, :type => :controller do
  let(:admin) { Admin.create!(first_name: "Jim", last_name: "Bob", phone: "(121)121-1212") }

  describe "GET #new" do
    # it "responds with status code 200" do
    #   get :new
    #   expect(response).to have_http_status 200
    # end

    # it "assigns the recent admins as @admins" do
    #   get :index
    #   expect(assigns(:admins)).to eq([admin])
    # end

    # it "renders the :index template" do
    #   get :index
    #   expect(response).to render_template(:index)
    # end
  end


end
