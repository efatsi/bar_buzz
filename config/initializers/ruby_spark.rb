module RubySparkConfig
  CONFIGURATION_FILE = Rails.root.join('config', "ruby_spark.yml")

  if File.exist?(CONFIGURATION_FILE)
    begin
      ruby_spark_app_config = YAML.load_file(CONFIGURATION_FILE).with_indifferent_access

      ENV["RUBY_SPARK_ACCESS_TOKEN"] = ruby_spark_app_config.fetch(:access_token)

    rescue KeyError
      abort "RubySpark app configuration incomplete. :access_token must be provided. For a basic version, run:\n\n    cp config/ruby_spark.yml.example config/ruby_spark.yml"
    end
  end

  begin
    ACCESS_TOKEN = ENV.fetch("RUBY_SPARK_ACCESS_TOKEN")
  rescue KeyError
    abort "RubySpark app configuration not found. Set ENV['RUBY_SPARK_ACCESS_TOKEN'] or run:\n\n    cp config/ruby_spark.yml.example config/ruby_spark.yml"
  end
end

RubySpark.configuration do |config|
  config.access_token = RubySparkConfig::ACCESS_TOKEN
  config.timeout      = 5.seconds
end
