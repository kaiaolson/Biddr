require 'rails_helper'

RSpec.describe BidsController, type: :controller do
  let(:auction) {FactoryGirl.create(:auction) }
  let(:bid)     {FactoryGirl.create(:bid, {auction: auction}) }
  let(:user)     {FactoryGirl.create(:user)}

  before { login(user) }
  describe "#create" do

    context "with valid attributes" do
        def valid_request
          post :create, auction_id: auction.id, bid: {amount: 100}
        end
        it "creates a record in the database" do
          expect{valid_request}.to change{Bid.count}.by(1)
        end
        it "redirects to the auction show page" do
          valid_request
          expect(response).to redirect_to(auction_path(auction))
        end
        it "sets a flash notice message" do
          valid_request
          expect(flash[:notice]).to be
        end
      end

      context "with invalid attributes" do

        def invalid_request
          post :create, auction_id: auction.id, bid: {amount: nil}
        end
        it "renders the auction show page " do
          invalid_request
          expect(response).to redirect_to(auction_path(auction))
        end
        it "doesn't create a record in the database" do
          expect{invalid_request}.to change{Bid.count}.by(0)
        end
        it "sets a flash alert message" do
          invalid_request
          expect(flash[:alert]).to be
        end
      end
  end
end
