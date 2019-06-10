class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  default_scope { order(id: :desc) }

  include AASM

  aasm do
    state :pending, initial: true
    state :paid, :prepared, :delivered, :refunded, :cancelled

    event :cancel do
      transitions from: :pending, to: :cancelled
    end

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :prepare do
      transitions from: :paid, to: :prepared
    end

    event :deliver do
      transitions from: :prepared, to: :delivered
    end

    event :refund do
      transitions from: [:paid, :prepared, :delivered], to: :refunded
    end
  end

end
