module Payable
  extend ActiveSupport::Concern

  def gateway
    @gateway ||= Braintree::Gateway.new(
      environment: :sandbox,
      merchant_id: 'jwb8xz5rcmwgrxx8',
      public_key: '2ntx664gzr9qqcg9',
      private_key: '5d360837b52855a174eeb64864aa9c6d'
    )
  end

  included do
  end

  class_methods do
  end
end