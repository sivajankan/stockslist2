Rails.application.config.middleware.use OmniAuth::Builder do
  #wstocks
  provider :twitter, 'JIZDqcMfUDVKu72KA6NQ', '7dcJyanxrHfMqG2Bm8CbgLEa3zQgYO3ipkDrDkW9Ww'
  provider :facebook, '322331431211797', '7360d711a6cc932c649dae05bfa69979'#, {client_options: {ssl: {ca_file: Rails.root.join('lib/assets/cacert.pem').to_s}}}
  
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  #provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end