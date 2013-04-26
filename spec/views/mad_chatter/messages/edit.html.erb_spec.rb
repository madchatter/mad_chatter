require 'spec_helper'

describe "messages/edit" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :text => "MyString",
      :html => "MyString",
      :references => ""
    ))
  end

  it "renders the edit message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path(@message), :method => "post" do
      assert_select "input#message_text", :name => "message[text]"
      assert_select "input#message_html", :name => "message[html]"
      assert_select "input#message_references", :name => "message[references]"
    end
  end
end
