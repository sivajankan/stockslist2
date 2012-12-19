require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the StocklistsHelper. For example:
#
# describe StocklistsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end

# describe StocklistsHelper do
  # pending "add some examples to (or delete) #{__FILE__}"
# end

describe StocklistsHelper do
  describe 'show_ipoyear' do
    it 'returns year from date string' do
      helper.show_ipoyear("1985-01-01").to_s.should == "1985"
    end
    
    it 'returns nil for nil' do
      nilobj = nil
      helper.show_ipoyear(nilobj).should be_nil
    end
  end
end