module Utils

  extend self

  def rm(file_path)
    `rm -f #{file_path.gsub(".tar.gz", '')}`
    `rm -f #{file_path}`
  end

  def compress(source)
    `tar -pcvzf #{source}.tar.gz #{source}`
    "#{source}.tar.gz"
  end

end
