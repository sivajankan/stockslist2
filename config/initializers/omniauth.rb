Rails.application.config.middleware.use OmniAuth::Builder do
  #wstocks
  provider :twitter, 'JIZDqcMfUDVKu72KA6NQ', '7dcJyanxrHfMqG2Bm8CbgLEa3zQgYO3ipkDrDkW9Ww'
  provider :facebook, '322331431211797', '7360d711a6cc932c649dae05bfa69979'
  #provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end