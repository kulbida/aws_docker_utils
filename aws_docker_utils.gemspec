# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aws_docker_utils/version'

Gem::Specification.new do |s|
  s.name        = 'aws_docker_utils'
  s.version     = AwsDockerUtils::VERSION
  s.date        = '2016-04-15'
  s.summary     = "Utils package for working with AWS and Docker."
  s.description = "Utils package for working with AWS and Docker."
  s.authors     = ["Bogdan Kulbida"]
  s.email       = "bkulbida@gmail.com"
  s.files       = `git ls-files`.split($\)
  s.require_paths = ["lib"]
  s.executables = ["aws_docker_utils"]
  s.homepage    = "http://rubygems.org/gems/aws_docker_utils"
  s.license     = "MIT"
  s.add_runtime_dependency "aws-sdk"
  s.add_runtime_dependency "docopt"
end
