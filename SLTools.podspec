Pod::Spec.new do |s|
  s.name         = "SLTools"
  s.version      = "0.0.1"
  s.summary      = "iOS candy tools to make your life simple."
  s.description  = "iOS candy tools to make your life simple."
  s.homepage     = "https://github.com/jkstyle-xiaoq/SLTools"

  s.license      = { :type => "MIT" }
  s.author             = { "jkstyle" => "jkstyle.xiaoq@gmail.com" }
  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/jkstyle-xiaoq/SLTools.git", :tag => s.version.to_s }
  s.source_files  = "Source/**/*.{h,m,swift}"

  s.requires_arc = true

  s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '4.0',
  }
end
