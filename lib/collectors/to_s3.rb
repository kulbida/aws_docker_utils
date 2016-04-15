require "./utils"
require "./docker_compose/client"
require "./s3/client"

module Collectors
  class ToS3

    def initialize(opts={})
      @bucket_name    = opts[:bucket_name]
      @db_name        = opts[:db_name]
      @task_name      = opts[:task] || "file"
      @container_name = opts[:container_name]

      @file_name   = "#{`date '+#{@task_name}_%y-%m-%d_%H-%M'`.chop}.sql"
    end

    def push
      DockerCompose::Client.new(container_name: @container_name, cmd: "pg_dump -U postgres -O #{@db_name} > #{@file_name}").exec
      file_name = Utils.compress(@file_name)

      s3 = S3::Client.new(file_name: file_name, bucket_name: @bucket_name)
      if s3.put(file_name)
        Utils.rm(file_name)
        puts "Pushed to S3."
      else
        puts "Unable to do the job."
      end
    end

  end
end
