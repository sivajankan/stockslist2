require 'spec_helper'

describe "home/index.html.haml" do
  it 'should have home welcome page' do
    render
    rendered.should match(/Welcome!/)
  end
end
