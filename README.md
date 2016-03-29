# Biddr

Final test for CodeCore development bootcamp.

## Instructions:

Build a simple bidding website.

### Part 1 (50%):

Implement the new / create actions for the auction with tests (RSpec - at least two examples per action)

Implement creating a bid on an auction with tests (RSpec- at least two examples per action)

Use a Javascript library to implement the date selector part (any library will do)


### Part 2 (15%):

Add state machine with these states to the auction model: draft / published / reserve met / won / canceled / reserve not met. Add events to the state machine that trigger going from one state to another.

Add user authentication and disallow users to bid on their own auctions.

Implement the ability to publish an auction by having a "publish" button on the auction show page. This should only be visible to the creator of the auction.


### Part 3 (15%):

Validate that bid prices must by higher than the current price of the auction. Set current price to highest new bid

Display users' full names beside their bids

Make a page to list all the bids that someone has made on all the auctions, it should be visible to logged in users only


### Part 4 (10%):

Make bidding on an auction happen with AJAX (use jQuery AJAX rather than Rails automatic AJAX). The new bid display should fade into the page.

Trigger moving auctions to "reserve met" state when a bid happens to be above the reserve price


### Part 5 (10%):

Add capybara tests for creating an auction and bidding on an auction (at least 2 each - Make sure to take user authentication into account).

Part 6 (10%):
Make sure that publishing an auction happens using a service object.
