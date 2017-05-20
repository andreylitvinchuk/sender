require 'rails_helper'

RSpec.describe "GameUsers", type: :request do
  describe "GET /game_users" do
    it "works! (now write some real specs)" do
      get game_users_path
      expect(response).to have_http_status(200)
    end
  end
end
