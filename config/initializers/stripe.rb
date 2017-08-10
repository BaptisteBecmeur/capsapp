Rails.configuration.stripe = {
  :publishable_key => 'pk_test_H24moO8nPQyqfLB1RFoJsiy3',
  :secret_key => 'sk_test_y8ly0WknegUuuOQpJTwshp2P'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
