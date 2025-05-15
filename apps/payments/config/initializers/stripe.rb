require 'stripe'

Stripe.api_key = ENV.fetch("STRIPE_SECRET_KEY")

Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key: ENV['STRIPE_SECRET_KEY'],
  webhook_secret: ENV['STRIPE_WEBHOOK_SECRET']
}



# Log the API key status (only in development)
if Rails.env.development?
  Rails.logger.info "Stripe API key #{Stripe.api_key.present? ? 'is set' : 'is not set'}"
  Rails.logger.info "Stripe API key value: #{Stripe.api_key}"
end 