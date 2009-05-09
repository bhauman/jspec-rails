# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jspec-rails_session',
  :secret      => 'bab44a3cf33c24eb4b762e10556c6fe0c10e5a8c6fe2158b7fb579a99ce4159c1acbc010d6594aa6ec77e150ddbb0168cddb6fcb41e5a037035ba48440635d20'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
