class PublishingsController < ApplicationController
  before_action :authenticate_user

  def create
    auction = current_user.auctions.find params[:auction_id]
    service = Auctions::PublishAuction.new(auction: auction)

    if service.call
      redirect_to auction, notice: "Published!"
    else
      redirect_to auction, alert: "Can't publish! Published already?"
    end
  end
end
