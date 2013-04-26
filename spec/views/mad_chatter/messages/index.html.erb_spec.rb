require 'spec_helper'

describe "messages/index" do
  before(:each) do
    assign(:messages, [
      stub_model(Message,
        :text => "Text",
        :html => "Html",
        :references => ""
      ),
      stub_model(Message,
        :text => "Text",
        :html => "Html",
        :references => ""
      )
    ])
  end

  it "renders a list of messages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => "Html".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
