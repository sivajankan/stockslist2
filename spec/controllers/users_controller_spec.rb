require 'spec_helper'
require 'javascript'

describe UsersController do
  
  before :each do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  # describe "GET 'show'" do
    # it "returns http success" do
      # get "show"
      # response.should be_success
    # end
  # end

end
