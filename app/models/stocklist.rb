class Stocklist < ActiveRecord::Base
  attr_accessible :industry, :ipoyear, :marketcap, :name, :sector, :symbol
  validates :symbol, :presence => true, :uniqueness => true
  #scope :for_year, lambda {|year| where("ipoyear >= ? and ipoyear <= ?", "#{year}-01-01", "#{year}-12-31")}
end