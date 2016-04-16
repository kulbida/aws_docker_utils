require 'yaml'

module AwsDockerUtils
  class AwsConfigStorage

    attr_accessor :config

    CONFIG_FILE_PATH = "./aws_docker_utils.yml"

    def initialize
      self.config = fetch_config
    end

    def persist!(key, value)
      `echo '#{key}: "#{value}"' >> #{file_name}`
    end

    def clear!
      `echo "# AWS credentials:" > #{file_name}`
    end

    def valid?
      @config && @config.fetch('access_key') && @config.fetch('secret_key')
    end

    private

    def exists?
      !`ls #{file_name}`.empty?
    end

    def fetch_config
      clear! unless exists?
      YAML::load_file(file_name)
    end

    def file_name
      CONFIG_FILE_PATH
    end

  end
end
