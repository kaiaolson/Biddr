class Auction < ActiveRecord::Base
  include AASM
  belongs_to :user
  has_many :bids

  validates :title, presence: true
  validates :end_date, presence: true
  validates :reserve_price, presence: true

  aasm whiny_transitions: false do
    state :draft, initial: true
    state :published
    state :cancelled
    state :won
    state :reserve_not_met
    state :reserve_met

    event :publish do
      transitions from: :draft, to: :published
    end

    event :win do
      transitions from: :published, to: :won
    end

    event :cancel do
      transitions from: [:draft, :published, :won], to: :cancelled
    end

    event :meet_reserve do
      transitions from: :published, to: :reserve_met
    end
  end

  # for multiples? makes sense to have these separate
  # aasm(:reserve, whiny_transitions: false) do
  #   state :reserve_not_met, initial: true
  #   state :reserve_met
  #
  #   event :meet_reserve do
  #     transitions from: :reserve_not_met, to: :reserve_met
  #   end
  # end

  def published
    where(aasm_state: :published)
  end
end
