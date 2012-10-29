class Stocklist < ActiveRecord::Base
  attr_accessible :industry, :ipoyear, :marketcap, :name, :sector, :symbol
end
