$: << File.expand_path('../lib', __FILE__)

require 'subpod/version'

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY

  s.name     = 'subpod'
  s.version  = SubPod::VERSION
  s.license  = 'MIT'
  s.email    = 'tang3w@gmail.com'
  s.author   = 'Tang Tianyong'
  s.homepage = 'http://tang3w.com'

  s.summary     = 'CocoaPods helper'
  s.description = 'Make Pods as a sub project'

  s.files = Dir['lib/**/*.rb']
  s.executables = %w(subpod)
  s.require_paths = %w(lib)

  s.add_runtime_dependency 'cocoapods', '~> 0.18.0'
  s.add_runtime_dependency 'clactive', '~> 0.0.5'
end
