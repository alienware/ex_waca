import Config

config :ex_waca,
  business_id: {:system, "WHATSAPP_BUSINESS_ID"},
  sender_id: {:system, "WHATSAPP_SENDER_ID"},
  access_token: {:system, "WHATSAPP_ACCESS_TOKEN"}

import_config "#{config_env()}.exs"
