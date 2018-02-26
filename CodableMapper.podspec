Pod::Spec.new do |s|
  s.name             = 'CodableMapper'
  s.version          = '0.1.0'
  s.summary          = 'JSON to Decodable Object inspired by ObjectMapper'
  s.description      = <<-DESC
  CodableMapper is a framework written in Swift that makes it easy for you to convert  your decodable model objects (classes and structs) from JSON.
  Inspired by ObjectMapper.
                       DESC

  s.homepage         = 'https://github.com/noppefoxwolf/CodableMapper.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tomoya Hirano' => 'noppelabs@gmail.com' }
  s.source           = { :git => 'https://github.com/noppefoxwolf/CodableMapper.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/noppefoxwolf'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CodableMapper/Classes/**/*'
end
