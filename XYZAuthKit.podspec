Pod::Spec.new do |s|
  s.name = 'XYZAuthKit'
  s.version = '1.0.0'
  s.summary = 'A Swift framework for XYZ authentication.'

  s.homepage = 'https://github.com/iftechio/XYZAuthKit'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'GongYuhua' => 'gongyuhua@iftech.io' }

  s.source = { :git => 'https://github.com/iftechio/XYZAuthKit.git', :tag => s.version.to_s }
  s.vendored_frameworks   = 'Sources/XYZAuthKit.xcframework'

  s.ios.deployment_target = "15.0"
end