module AwsDockerUtils
  class Compressor

    def initialize(file_path)
      @file_path = file_path
    end

    def compress
      `tar -jcvf #{@file_path}.tar.gz2 #{@file_path}`
      "#{@file_path}.tar.gz2"
    end

  end
end
