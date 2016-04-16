require 'io/console'
require_relative '../aws_config_storage'

module AwsDockerUtils
  module Controllers

    class Configurator

      def initialize(opts={})
        @opts = opts
        @config = AwsConfigStorage.new
      end

      def activate
        if @opts.fetch('init')
          publish(:access_key, std_input("Please enter AWS user ACCESS KEY:"))
          publish(:secret_key, std_input("Please enter AWS user SERCET KEY:"))
          publish(:region, std_input("Please enter AWS preferred REGION:"))
        else
          @config.clear!
        end
      end

      private

      def std_input(request)
        print request
        STDIN.noecho do |b|
          b.gets.chomp
        end 
      end

      def publish(type, value)
        @config.persist!(type, value)
      end

    end

  end
end
