require "spec_helper"

module MadChatter
  describe RoomsController do
    describe "routing" do
  
      it "routes to #index" do
        get("/rooms").should route_to("rooms#index")
      end
  
      it "routes to #new" do
        get("/rooms/new").should route_to("rooms#new")
      end
  
      it "routes to #show" do
        get("/rooms/1").should route_to("rooms#show", :id => "1")
      end
  
      it "routes to #edit" do
        get("/rooms/1/edit").should route_to("rooms#edit", :id => "1")
      end
  
      it "routes to #create" do
        post("/rooms").should route_to("rooms#create")
      end
  
      it "routes to #update" do
        put("/rooms/1").should route_to("rooms#update", :id => "1")
      end
  
      it "routes to #destroy" do
        delete("/rooms/1").should route_to("rooms#destroy", :id => "1")
      end
  
    end
  end
end
