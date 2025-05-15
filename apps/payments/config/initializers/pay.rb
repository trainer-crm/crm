# config/initializers/pay.rb

Pay.setup do |config|
  # Business info (used in receipts, etc)
  config.business_name    = "Business Name"
  config.business_address = "1600 Pennsylvania Avenue NW"
  config.application_name = "My App"
  config.support_email    = "Business Name <support@example.com>"

  # Default product/plan names
  config.default_product_name = "default"
  config.default_plan_name    = "default"

  # Routes
  config.automount_routes = true
  config.routes_path      = "/pay"

  # Only Stripe
  config.enabled_processors = [:stripe]

  # Stripe credentials
  # config.publishable_key = Rails.application.credentials.dig(:stripe, :publishable_key)
  # config.secret_key      = Rails.application.credentials.dig(:stripe, :secret_key)
  # config.signing_secret  = Rails.application.credentials.dig(:stripe, :webhook_secret)

  # Email settings
  config.send_emails = true
  config.emails.payment_action_required = true
  config.emails.payment_failed          = true
  config.emails.receipt                 = true
  config.emails.refund                  = true
  config.emails.subscription_renewing   = ->(pay_subscription, price) {
    price&.type == "recurring" && price.recurring&.interval == "year"
  }
  config.emails.subscription_trial_will_end = true
  config.emails.subscription_trial_ended   = true

  # (Optional) Customize mail recipients or mail arguments here
end
