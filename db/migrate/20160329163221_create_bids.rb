class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.float :amount
      t.references :auction, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
