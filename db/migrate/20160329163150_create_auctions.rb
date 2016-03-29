class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :details
      t.datetime :end_date
      t.float :reserve_price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
