require "spec_helper"

describe SubMoodsController do
  describe "routing" do

    it "routes to #index" do
      get("/sub_moods").should route_to("sub_moods#index")
    end

    it "routes to #new" do
      get("/sub_moods/new").should route_to("sub_moods#new")
    end

    it "routes to #show" do
      get("/sub_moods/1").should route_to("sub_moods#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sub_moods/1/edit").should route_to("sub_moods#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sub_moods").should route_to("sub_moods#create")
    end

    it "routes to #update" do
      put("/sub_moods/1").should route_to("sub_moods#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sub_moods/1").should route_to("sub_moods#destroy", :id => "1")
    end

  end
end
