require_relative "controllers/s3.rb"
require_relative "controllers/configurator.rb"

class Router

  def initialize(opts={})
    @opts = opts
  end

  def route!
    case
    when @opts.fetch('configure')   then AwsDockerUtils::Controllers::Configurator.new(@opts)
    when @opts.fetch('backup_file') then AwsDockerUtils::Controllers::S3.new(@opts)
    else raise "NOP"
    end
  end

  private

end
