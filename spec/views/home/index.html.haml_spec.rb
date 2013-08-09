require 'spec_helper'

describe "home/index.html.haml" do

  before :each do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
    
  it 'should have home welcome page' do
    render
    rendered.should match(/Welcome!/)
  end
end
