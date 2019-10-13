Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter,
        'K33U15OnqE2schzTdMgzUbocU',
        'DtIFPowC074Yb9s16qThBafIjSSWHFT7tUF5KI32fN1WPBoBJx'
end