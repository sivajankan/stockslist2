class ChangeMarketcapType < ActiveRecord::Migration
  def up
    change_column :stocklists, :marketcap, :string

    add_index :stocklists, :symbol, :unique => true
  end

  def down
    change_column :stocklists, :marketcap, :type => integer

    remove_index :stocklists, :symbol
  end
end
