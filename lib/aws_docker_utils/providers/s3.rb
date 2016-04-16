require 'yaml'
require 'aws-sdk'

module AwsDockerUtils
  module Providers

    class S3

      DEFAULT_REGION = "us-east-1"

      def initialize(opts={})
        @bucket_name = opts.fetch(:bucket_name)

        storage = AwsConfigStorage.new
        client = if storage.valid?
          config = storage.config
          Aws::S3::Client.new(
            region: (config.fetch("region").to_s || DEFAULT_REGION),
            access_key_id: config.fetch("access_key").to_s,
            secret_access_key: config.fetch("secret_key").to_s
          )
        else
          Aws::S3::Client.new(region: DEFAULT_REGION)
        end

        @s3 = Aws::S3::Resource.new(client: client)
      end

      def put(file_path)
        raise "Please set bucket name with constructor." if @bucket_name.nil?

        bucket = create_bucket(@bucket_name)
        obj    = bucket.object(File.basename(file_path.gsub(/\.sql.+/, '.sql')))

        if obj.upload_file(file_path)
          return true
        else
          puts "could not upload file #{@file_path} to S3."
        end

        false
      end

      private

      def create_bucket(bucket_name)
        bucket = @s3.bucket(bucket_name)
        unless bucket.exists?
          puts 'Bucket does not exist. Creating...'
          bucket.create
          puts 'Done.'
        end
        bucket
      end

    end

  end
end
