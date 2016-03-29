class AddUserReferencesToBids < ActiveRecord::Migration
  def change
    add_reference :bids, :user, index: true, foreign_key: true
  end
end
