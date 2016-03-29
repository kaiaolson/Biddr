require 'rails_helper'

RSpec.feature "Auctions", type: :feature do
  let(:user) { FactoryGirl.create(:user) }

  describe "Create Auction" do
    before { login_via_web(user) }
    context "with valid attributes" do
      it "goes to the auction show page / it shows message 'auction created successfully'" do
        visit new_auction_path

        valid_auction = FactoryGirl.attributes_for(:auction)

        fill_in "Title", with: valid_auction[:title]
        fill_in "Details", with: valid_auction[:details]
        fill_in "End date", with: valid_auction[:end_date]
        fill_in "Reserve price", with: valid_auction[:reserve_price]

        click_button "Create Auction"

        expect(current_path).to eq(auction_path(Auction.last))
        expect(page).to have_text /auction created successfully/i
      end

    end

    context "with invalid attributes" do
      it "it shows a message 'auction not created'" do
        visit new_auction_path

        click_button "Create Auction"

        expect(page).to have_text /auction not created/i
      end
    end
  end
end
