# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rspec_session',
  :secret      => '237ef759bc151994b9e18c0524f811c732d4a065d553c636b9bebfce19954948141012027bc86f033fbf5f4fc1d8daa2f5fd3e369b605b8e051b3c97f35639e5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
