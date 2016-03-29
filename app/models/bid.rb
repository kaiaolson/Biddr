class Bid < ActiveRecord::Base
  belongs_to :auction
  belongs_to :user

  validates :amount, presence: true, numericality: {greater_than: :auction_current}


  def auction_current
    auction.current_price
  end

  def auction_title
    auction.title
  end

  def user_full_name
    user.full_name
  end
end
