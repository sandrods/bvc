# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bvc_session',
  :secret      => '3e3c265cfc9f6e2e520af3084a38b4373a3430c5131fcbe97f973590b703abd6ba7cb98f9f0da5de625f4cd32824a61fa2b19feb0ab371831e94d611ebfa3a39'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
