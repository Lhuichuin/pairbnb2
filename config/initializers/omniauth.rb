# In config/initializers/omniauth.rb
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'], info_fields: 'name,email'
    # scope: 'email,user_birthday,read_stream', display: 'popup'
  end