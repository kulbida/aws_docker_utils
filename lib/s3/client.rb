require 'yaml'
require 'aws-sdk'

module S3
  class Client

    DEFAULT_REGION = "us-east-1"

    def initialize(opts={})
      @bucket_name = opts[:bucket_name]

      config = YAML.load(File.read(File.join(File.dirname(__FILE__), "credentials.yml")))
      client = Aws::S3::Client.new(
        region: (config["region"] || DEFAULT_REGION),
        access_key_id: config["access_key"],
        secret_access_key: config["secret_key"]
      )
      @s3 = Aws::S3::Resource.new(client: client)
    end

    def put(file_path)
      raise "Please set bucket name with constructor." if @bucket_name.nil?

      bucket = create_bucket(@bucket_name)
      obj    = bucket.object(File.basename(file_path))

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
