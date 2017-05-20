require "rails_helper"

RSpec.describe GameUsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/game_users").to route_to("game_users#index")
    end

    it "routes to #new" do
      expect(:get => "/game_users/new").to route_to("game_users#new")
    end

    it "routes to #show" do
      expect(:get => "/game_users/1").to route_to("game_users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/game_users/1/edit").to route_to("game_users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/game_users").to route_to("game_users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/game_users/1").to route_to("game_users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/game_users/1").to route_to("game_users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/game_users/1").to route_to("game_users#destroy", :id => "1")
    end

  end
end
