require "spec_helper"

describe StocklistsController do
  describe "routing" do

    it "routes to #index" do
      get("/stocklists").should route_to("stocklists#index")
    end

    it "routes to #new" do
      get("/stocklists/new").should route_to("stocklists#new")
    end

    it "routes to #show" do
      get("/stocklists/1").should route_to("stocklists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stocklists/1/edit").should route_to("stocklists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stocklists").should route_to("stocklists#create")
    end

    it "routes to #update" do
      put("/stocklists/1").should route_to("stocklists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stocklists/1").should route_to("stocklists#destroy", :id => "1")
    end

  end
end
