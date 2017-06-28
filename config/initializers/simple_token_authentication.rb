SimpleTokenAuthentication.configure do |config|
  config.header_names = { user: { authentication_token: 'X-User-Token' } }
  config.identifiers = { user: :authentication_token }
end
