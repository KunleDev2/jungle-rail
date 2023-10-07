require 'rails_helper'

RSpec.describe "App::Controllers::Abouts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/app/controllers/about/index"
      expect(response).to have_http_status(:success)
    end
  end

end
