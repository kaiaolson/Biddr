class User < ActiveRecord::Base
  has_secure_password

  has_many :auctions, dependent: :destroy
  has_many :bids, dependent: :destroy

  validates :password, length: {minimum: 6}, on: :create
  validates :first_name, presence: true, on: :create
  validates :last_name, presence: true, on: :create
  validates :email, presence: true, uniqueness: true,
            format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
            on: :create

  def full_name
    "#{first_name} #{last_name}".titleize
  end
end
