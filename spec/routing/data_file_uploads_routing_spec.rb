require "spec_helper"

describe DataFileUploadsController do
  describe "routing" do

    it "routes to #index" do
      get("/data_file_uploads").should route_to("data_file_uploads#index")
    end

    it "routes to #new" do
      get("/data_file_uploads/new").should route_to("data_file_uploads#new")
    end

    it "routes to #show" do
      get("/data_file_uploads/1").should route_to("data_file_uploads#show", :id => "1")
    end

    it "routes to #edit" do
      get("/data_file_uploads/1/edit").should route_to("data_file_uploads#edit", :id => "1")
    end

    it "routes to #create" do
      post("/data_file_uploads").should route_to("data_file_uploads#create")
    end

    it "routes to #update" do
      put("/data_file_uploads/1").should route_to("data_file_uploads#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/data_file_uploads/1").should route_to("data_file_uploads#destroy", :id => "1")
    end

  end
end
