require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do
  let(:user) {FactoryGirl.create(:user) }
  before {login(user)}

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
    it "instantiates a new Auction and sets it equal to @auction" do
      get :new
      expect(assigns(:auction)).to be_a_new(Auction)
    end
  end

  describe "#create" do

    context "with valid attributes" do
        def valid_request
          post :create, auction: FactoryGirl.attributes_for(:auction)
        end
        it "creates a record in the database" do
          expect{valid_request}.to change{Auction.count}.by(1)
        end
        it "redirects to the auction show page" do
          valid_request
          expect(response).to redirect_to(auction_path(Auction.last))
        end
        it "sets a flash notice message" do
          valid_request
          expect(flash[:notice]).to be
        end
      end

      context "with invalid attributes" do

        def invalid_request
          post :create, auction: {title: nil}
        end
        it "renders the new template" do
          invalid_request
          expect(response).to render_template(:new)
        end
        it "doesn't create a record in the database" do
          expect{invalid_request}.to change{Auction.count}.by(0)
        end
        it "sets a flash alert message" do
          invalid_request
          expect(flash[:alert]).to be
        end
      end
  end
end
