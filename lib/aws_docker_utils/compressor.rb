module AwsDockerUtils
  class Compressor

    def initialize(file_path)
      @file_path = file_path
    end

    def compress
      # for now it does nothing
      @file_path
    end

  end
end
