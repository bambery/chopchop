singly = YAML.load_file("config/singly.yml")

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :singly, singly["client_id"], singly["client_secret"]
end