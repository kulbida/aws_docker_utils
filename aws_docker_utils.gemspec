Gem::Specification.new do |s|
  s.name        = 'aws_docker_utils'
  s.version     = '0.0.1'
  s.date        = '2016-04-15'
  s.summary     = "Utils package for working with AWS and Docker."
  s.description = "Utils package for working with AWS and Docker."
  s.authors     = ["Bogdan Kulbida"]
  s.email       = "bkulbida@gmail.com"
  s.files       = ["lib/s3/agent.rb"]
  s.homepage    = "http://rubygems.org/gems/aws_docker_utils"
  s.license     = "MIT"
  s.add_runtime_dependency 'aws-sdk'
end
