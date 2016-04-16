require 'tempfile'
require_relative "../compressor"
require_relative "../docker/client"
require_relative "../providers/s3"

module AwsDockerUtils
  module Controllers

    class S3

      def initialize(opts={})
        @bucket_name    = opts.fetch('<s3_bucket_name>')
        @task_name      = opts.fetch('<as_task>', "file")
        @container_name = opts.fetch('<container_name>')
        @cmd            = opts.fetch('<cmd>')
        @file_name      = Tempfile.new("#{`date '+#{@task_name}_%y-%m-%d_%H-%M'`.chop}.sql")
      end

      def activate
        Docker::Client.new(container_name: @container_name, cmd: "#{@cmd} > #{@file_name.path}").exec
        s3 = Providers::S3.new(bucket_name: @bucket_name)
        if s3.put(Compressor.new(@file_name.path).compress)
          puts "Pushed to S3."
        else
          puts "Unable to do the job."
        end
        @file_name.close
      end

    end

  end
end
