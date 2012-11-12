class Stocklist < ActiveRecord::Base
  attr_accessible :industry, :ipoyear, :marketcap, :name, :sector, :symbol
  validates :symbol, :presence => true, :uniqueness => true
end
