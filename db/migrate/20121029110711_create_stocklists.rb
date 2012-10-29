class CreateStocklists < ActiveRecord::Migration
  def change
    create_table :stocklists do |t|
      t.string :symbol
      t.string :name
      t.number :marketcap
      t.date :ipoyear
      t.string :sector
      t.string :industry

      t.timestamps
    end
  end
end
