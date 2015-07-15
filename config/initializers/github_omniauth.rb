Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :github,
    Rails.application.secrets.github_id,
    Rails.application.secrets.github_client_secret,
    scope: 'user:email'
  )
end
