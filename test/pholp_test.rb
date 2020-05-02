require "test_helper"
require "puma/configuration"

class PholpTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Pholp::VERSION
  end

  def test_it_does_something_useful
    assert_kind_of Class, Puma::Plugins.find("pholp")
  end

  def test_config
    conf = Puma::Configuration.new do |config|
      config.plugin :pholp
    end

    conf.load

    assert_equal ["ssl://0.0.0.0:3000?cert=./config/cert/localhost.pem&key=./config/cert/localhost-key.pem&verify_mode=none&no_tlsv1=false&no_tlsv1_1=false"], conf.options[:binds]
  end
end
