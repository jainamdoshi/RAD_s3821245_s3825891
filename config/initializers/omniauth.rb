#config/initializers/omniauth.rb
 
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'jHhfTCwp7YbPJayjf6mMXk1vB', 'qxgcLz0mCF515OpggPU9CT7jVoUMnrLnH9sDTuNFV7JczUDFmG'
end