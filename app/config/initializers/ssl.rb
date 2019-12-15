# サブドメインのHSTS無向
Rails.application.config.ssl_options = { hsts: { subdomains: false } }