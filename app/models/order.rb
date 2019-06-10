class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  default_scope { order(id: :desc) }

  include AASM

  aasm column: 'state' do
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
      after do
        # 發簡訊
      end
    end

    event :refund do
      transitions from: [:paid, :prepared, :delivered], to: :refunded
    end
  end

end
