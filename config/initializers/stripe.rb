Rails.configuration.stripe = {
  publishable_key: 'pk_test_a16qIgYkFnx8jVyXFffMLHhL',
  secret_key: 'sk_test_SCZWbAvqKXuEABEJE1X4nsED'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
