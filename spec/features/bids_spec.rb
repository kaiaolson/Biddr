require 'rails_helper'

RSpec.feature "Bids", type: :feature do
  let(:user) { FactoryGirl.create(:user) }
  let(:auction) { FactoryGirl.create(:auction) }
  let(:bid) { FactoryGirl.create(:bid, {auction: auction}) }

  describe "Create Bid" do
    before{ login_via_web(user) }
    context "with valid attributes" do
      it "displays the bid on the auction page / it displays the text 'bid submitted'" do
        visit auction_path(auction.id)

        fill_in "Amount", with: 10
        click_button "Create Bid"

        expect(page).to have_text("10")
        expect(page).to have_text /bid submitted/i
      end
    end

    context "with invalid attributes" do
      context "with empty amount" do
        it "shows an alert message 'bid not created'" do
          visit auction_path(auction.id)
          click_button "Create Bid"

          expect(page).to have_text /bid not created/i

        end
      end
    end

  end
end
