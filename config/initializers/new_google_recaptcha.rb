if Object.const_defined?('NewGoogleRecaptcha')
  NewGoogleRecaptcha.setup do |config|
    config.site_key   = ENV["SITE_KEY_RECAPTCHA"]
    config.secret_key = ENV["SECRET_KEY_RECAPTCHA"]
    config.minimum_score = 0.5
  end
end
