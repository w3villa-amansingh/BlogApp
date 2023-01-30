Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, "78037476633-0v94erv85khs1mefut53i6ccor20rrcj.apps.googleusercontent.com","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"
  end