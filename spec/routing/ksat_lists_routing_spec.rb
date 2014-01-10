require "spec_helper"

describe KsatListsController do
  describe "routing" do

    it "routes to #index" do
      get("/ksat_lists").should route_to("ksat_lists#index")
    end

    it "routes to #new" do
      get("/ksat_lists/new").should route_to("ksat_lists#new")
    end

    it "routes to #show" do
      get("/ksat_lists/1").should route_to("ksat_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ksat_lists/1/edit").should route_to("ksat_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ksat_lists").should route_to("ksat_lists#create")
    end

    it "routes to #update" do
      put("/ksat_lists/1").should route_to("ksat_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ksat_lists/1").should route_to("ksat_lists#destroy", :id => "1")
    end

  end
end
