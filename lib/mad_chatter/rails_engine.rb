require 'strong_parameters' unless Rails::VERSION::MAJOR == 4

module MadChatter
  class RailsEngine < ::Rails::Engine
    isolate_namespace MadChatter

    config.after_initialize do
      $redis ||= ::Redis.new
    end

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

  end
end
