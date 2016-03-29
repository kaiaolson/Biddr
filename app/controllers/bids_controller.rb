class BidsController < ApplicationController
  before_action :authenticate_user, only: [:create, :index]
  def new
  end

  def create
    @bid = Bid.new bid_params
    @auction = Auction.find(params[:auction_id])
    @bid.auction = @auction
    @bid.user = current_user
    respond_to do |format|
      if @bid.save
        update_auction
        @auction = @auction.decorate
        format.html {redirect_to @auction, notice: "Bid submitted!"}
        format.js {render :create_success}
      else
        format.html { flash[:alert] = "Bid not created!"
                      redirect_to @auction }
        format.js {render :create_failure}
      end
    end
  end

  def index
    @bids = current_user.bids
  end

  private

  def bid_params
    params.require(:bid).permit(:amount)
  end

  def update_auction
    @auction.current_price = @bid.amount
    if @bid.amount >= @auction.reserve_price
      @auction.meet_reserve
    end
    @auction.save
  end
end
