require 'puma'
require "puma/plugin"

Puma::Plugin.create do
  def config(c)
    cert_dir = ENV.fetch('PHOLP_CERT_DIR') { './config/cert' }
    cert = ENV.fetch('PHOLP_CERT_FILENAME') { "#{cert_dir}/localhost.pem" }
    key = ENV.fetch('PHOLP_CERT_KEYNAME') { "#{cert_dir}/localhost-key.pem" }
    bind_address = ENV.fetch('PHOLP_BIND_ADDRESS') { "0.0.0.0"}
    port = ENV.fetch('PHOLP_PORT') { ENV.fetch('PORT') { 3000 } }
    c.clear_binds! if ENV.fetch('PHOLP_ONLY_HTTPS') { 'true' }
    c.ssl_bind bind_address, port, cert: cert, key: key
  end
end
