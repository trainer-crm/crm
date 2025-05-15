class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Pay integration
  pay_customer stripe_attributes: :stripe_attributes

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true

  # Associations
  has_many :subscriptions
  has_many :charges
  has_many :payment_methods

  def stripe_attributes(pay_customer)
    {
      address: {
        city: pay_customer.owner.city,
        country: pay_customer.owner.country
      },
      metadata: {
        pay_customer_id: pay_customer.id,
        user_id: id # or pay_customer.owner_id
      }
    }
  end
end