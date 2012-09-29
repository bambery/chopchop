singly = YAML.load_file("config/singly.yml")

Chopchop::Application.config.middleware.use OmniAuth::Builder do
  provider :singly, singly["client_id"], singly["client_secret"]
end