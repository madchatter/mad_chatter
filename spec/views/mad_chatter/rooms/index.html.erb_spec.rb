require 'spec_helper'

describe "rooms/index" do
  before(:each) do
    assign(:rooms, [
      stub_model(Room,
        :name => "Name"
      ),
      stub_model(Room,
        :name => "Name"
      )
    ])
  end

  it "renders a list of rooms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
