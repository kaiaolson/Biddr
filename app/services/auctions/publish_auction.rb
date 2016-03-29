class Auctions::PublishAuction
  include Virtus.model

  attribute :auction, Auction

  def call
    if auction.publish!
      true
    else
      false
    end
  end
end
