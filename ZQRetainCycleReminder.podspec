Pod::Spec.new do |s|
  s.name             = 'ZQRetainCycleReminder'
  s.version          = '1.0.0'
  s.summary          = '支持dealloc log和循环引用界面提示'
  s.homepage         = 'https://github.com/AngleZhou/ZQRetainCycleReminder.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ZhouQian' => 'zhouq87724@163.com' }
  s.source           = { :git => 'https://github.com/AngleZhou/ZQRetainCycleReminder.git', :tag => s.version.to_s}
  s.ios.deployment_target = '8.0'
  s.source_files = 'ZQRetainCycleReminder/Classes/*'
  s.frameworks = 'UIKit'
  s.requires_arc = true
end
