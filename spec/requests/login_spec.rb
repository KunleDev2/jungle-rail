require 'rails_helper'

RSpec.describe "Logins", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/login/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/login/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/login/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
