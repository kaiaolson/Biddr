class AddCurrentPriceColumnToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :current_price, :float, default: 1
  end
end
