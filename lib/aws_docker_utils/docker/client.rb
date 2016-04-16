module AwsDockerUtils
  module Docker

    class Client

      def initialize(opts={})
        @container_name = opts[:container_name]
        @cmd            = opts[:cmd]
      end

      def exec
        `docker exec $(docker ps -q --filter 'name=#{@container_name}') #{@cmd}`
      end

    end

  end
end
