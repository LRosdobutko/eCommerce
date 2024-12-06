rails.configuration.stripe[:publishable_key] = ENV["STRIPE_PUBLISHABLE_KEY"]
rails.configuration.stripe[:secret_key] = ENV["STRIPE_SECRET_KEY"]


stripe.api_key = rails.configuration.stripe[:secret_key]
